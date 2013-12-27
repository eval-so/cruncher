{-# LANGUAGE OverloadedStrings #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : experimental
--
-- Provides our actual sandboxing capabilities by making heavy use of 'Shelly'
-- to call out to the SELinux-provided @sandbox@ command.
--
-- Right now, it is heavily coupled to Cruncher, but it could probably be made
-- into its own little library, without much grief, if ever necessary.

module Data.Cruncher.SELinux (
    isSELinuxEnforcing
  , runInSandbox
  , compile
  , runRequest
)
where


import qualified Data.Cruncher.FinalResult as FR
import Data.Cruncher.Language
import Data.Cruncher.Language.Everything (languages)
import Data.Cruncher.Request (Request (..))
import Data.Cruncher.Result (Result (..))

import Control.Applicative ((<$>))
import Control.Monad
import Control.Monad.IO.Class
import qualified Data.ByteString.Char8 as C8
import qualified Data.ByteString as BS
import Data.ByteString.Base64 (decodeLenient, encode)
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import qualified Data.Text as T
import Data.Time.Clock.POSIX
import qualified Shelly as S
import System.Directory (createDirectory, doesDirectoryExist, getTemporaryDirectory, removeDirectoryRecursive)
import System.FilePath ((</>))
import System.IO.HVFS.Utils (SystemFS(..))
import System.IO.Temp (createTempDirectory)
import System.Path (recurseDir)

-- | Determine whether SELinux is enforcing.
isSELinuxEnforcing :: IO Bool
isSELinuxEnforcing = S.shelly $ S.silently $ do
  x <- T.strip <$> S.cmd "getenforce"
  return $ x == "Enforcing"


-- | Create a workspace to hold files relevant to this evaluation.
--
--   This will use the system's default temporary directory, as decided by
--   'getTemporaryDirectory' - usually this is @/tmp@ on Linux systems.
--
--   In addition to creating the home (@~/@) directory for the evaluation, it
--   also creates a @.tmp/@ directory inside of it, in addition to an @output@
--   directory whose files are base-64 encoded and returned in the 'outputFiles'
--   of the 'Result'.
createEvalWorkspace :: IO FilePath
createEvalWorkspace = do
  ws <- getTemporaryDirectory >>= flip createTempDirectory "eval-"
  createDirectory $ ws </> ".tmp"
  createDirectory $ ws </> "output"
  return ws

-- | Construct a sandbox command for a language.
sandboxCommand :: Int -> FilePath -> (T.Text, [T.Text])
sandboxCommand a fp = ("timeout",
                       [t, "sandbox", "-H", T.pack fp, "-T",
                        T.pack (fp </> ".tmp"), "-t", "sandbox_x_t", "timeout",
                        t])
  where
    t = T.pack $ show a

runInSandbox :: [T.Text] -> Int -> Maybe T.Text -> FilePath -> IO Result
runInSandbox cmd t stdin' fp = S.shellyNoDir $ S.silently $ S.errExit False $ do
  startTime <- liftIO $ fmap (*1000) getPOSIXTime
  S.setStdin (fromMaybe "" stdin')
  out <- S.run (S.fromText $ fst sbc) (snd sbc ++ cmd)
  endTime <- liftIO $ fmap (*1000) getPOSIXTime
  err <- S.lastStderr
  exit <- S.lastExitCode
  return Result {
      stdout = out
    , stderr = err
    , wallTime = read $ takeWhile (/= '.') $ show (endTime - startTime)
    , exitCode = exit
  }
  where
    sbc = sandboxCommand t fp

-- | Compile something in a sandbox.
--   TODO: Move hardcoded timeout to config or something.
--
--   If there is no 'compileCommand' defined for the given 'Language', we return
--   Nothing, so that this can be used in a monadic chain with no averse
--   effects.
--
--   If there is a 'compileCommand', we run it and check its 'exitCode' field,
--   returning the appropriate side of an 'Either' 'Result' ('Left' = non-0,
--   'Right' = 0).
compile :: Language -> FilePath -> IO (Maybe Result)
compile l fp =
  case compileCommand l of
    Nothing -> return Nothing
    Just c -> do
      result <- runInSandbox c (fromMaybe 5 (compileTimeout l)) Nothing fp
      return $ Just result

-- | Execute something in a sandbox.
--   TODO: Move hardcoded timeout to config or something.
--
execute :: Language -> Maybe T.Text -> FilePath -> IO Result
execute l =
  runInSandbox (runCommand l) (fromMaybe 5 (compileTimeout l))

-- | Write all files (including base64'd support files) to the sandbox path.
writeCode :: Language -> Request -> FilePath -> IO ()
writeCode l r fp = do
  writeFile (fp </> codeFilename l) (T.unpack $ code r)
  case files r of
    Nothing -> return ()
    Just fs -> do
      mapM_ (\x -> writeFile (fp </> fst x) (C8.unpack . decodeLenient $ snd x)) fs
      return ()

-- | Base64 all files in the workspace's @output/@ directory.
base64map :: FilePath -> IO (Map String BS.ByteString)
base64map ws = do
  outputFiles' <- nonDirectoryOutputs
  if not (any (/= outputDir) outputFiles')
    then return $ Map.fromList []
    else do
      encoded <- mapM base64file outputFiles'
      return $ Map.fromList encoded
 where
   base64file :: FilePath -> IO (String, BS.ByteString)
   base64file f = do
     bs <- encode <$> BS.readFile f
     return (drop (1 + length outputDir) f, bs)

   outputDir :: FilePath
   outputDir = ws </> "output"

   nonDirectoryOutputs :: IO [FilePath]
   nonDirectoryOutputs = do
     fs <- recurseDir SystemFS outputDir
     filterM (fmap not . doesDirectoryExist) fs

-- | Perform the entire process of compilation and execution.
runRequest :: Request -> IO FR.FinalResult
runRequest r =
  case Map.lookup (language r) languages of
    Nothing -> return FR.NoSuchLanguage
    Just l -> do
      ws <- createEvalWorkspace
      writeCode l r ws
      c <- compile l ws

      -- TODO: I suspect we can clean this logic up a lot.
      result <- if compileOnly r
                then do
                  outputFiles' <- base64map ws
                  return $ FR.FinalResult c Nothing outputFiles'
                else do
                  e <- execute l (stdin r) ws
                  outputFiles' <- base64map ws
                  return $ FR.FinalResult c (Just e) outputFiles'
      removeDirectoryRecursive ws
      return result
