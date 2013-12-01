{-# LANGUAGE OverloadedStrings, Trustworthy #-}
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

import Control.Applicative
import Control.Monad
import qualified Data.ByteString.Char8 as C8
import Data.ByteString.Base64 (decodeLenient)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import qualified Data.Text as T
import Data.Time.Clock.POSIX
import Shelly hiding (FilePath, (</>))
import System.Directory (createDirectory, getTemporaryDirectory)
import System.FilePath ((</>))
import System.IO.Temp (createTempDirectory)

import Data.Cruncher.Language
import Data.Cruncher.Request (Request (..))
import Data.Cruncher.Result (Result (..))

import Data.Cruncher.Language.Everything

-- | Determine whether SELinux is enforcing.
isSELinuxEnforcing :: IO Bool
isSELinuxEnforcing = shelly $ silently $ do
  x <- T.strip <$> cmd "getenforce"
  return $ x == "Enforcing"


-- | Create a workspace to hold files relevant to this evaluation.
--
--   This will use the system's default temporary directory, as decided by
--   'getTemporaryDirectory' - usually this is @/tmp@ on Linux systems.
createEvalWorkspace :: IO FilePath
createEvalWorkspace = do
  ws <- getTemporaryDirectory >>= flip createTempDirectory "eval-"
  createDirectory $ ws </> ".tmp"
  return ws

-- | Construct a sandbox command for a language.
sandboxCommand :: Int -> FilePath -> (T.Text, [T.Text])
sandboxCommand a fp = ("timeout",
                       [t, "sandbox", "-H", T.pack fp, "-T",
                        T.pack (fp </> ".tmp"), "-t", "sandbox_x_t", "timeout",
                        t])
  where
    t = T.pack $ show a

runInSandbox :: [T.Text] -> Int -> FilePath -> IO Result
runInSandbox cmd t fp = shellyNoDir $ silently $ errExit False $ do
  startTime <- liftIO $ fmap (*1000) getPOSIXTime
  out <- run (fromText $ fst sbc) (snd sbc ++ cmd)
  endTime <- liftIO $ fmap (*1000) getPOSIXTime
  err <- lastStderr
  exit <- lastExitCode
  return Result {
      stdout = out
    , stderr = err
    , wallTime = read $ takeWhile (/= '.') $ show (endTime - startTime)
    , exitCode = exit
    , outputFiles = []
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
compile :: Language -> Request -> FilePath -> IO (Maybe Result)
compile l r fp =
  case compileCommand l of
    Nothing -> return Nothing
    Just c -> do
      result <- runInSandbox c (fromMaybe 5 (compileTimeout l)) fp
      return $ Just result

-- | Execute something in a sandbox.
--   TODO: Move hardcoded timeout to config or something.
--
execute :: Language -> Request -> FilePath -> IO Result
execute l r fp =
  runInSandbox (runCommand l) (fromMaybe 5 (compileTimeout l)) fp
  where
    fn = fromMaybe (codeFilename l) (binaryFilename l)

-- | Write all files (including base64'd support files) to the sandbox path.
writeCode :: Language -> Request -> FilePath -> IO ()
writeCode l r fp = do
  writeFile (fp </> codeFilename l) (T.unpack $ code r)
  case files r of
    Nothing -> return ()
    Just fs -> do
      mapM_ (\x -> writeFile (fp </> fst x) (C8.unpack . decodeLenient $ snd x)) fs
      return ()

-- | Perform the entire process of compilation and execution.
runRequest :: Request -> IO (Maybe (Maybe Result, Result))
runRequest r = do
  case (Map.lookup (language r) languages) of
    Nothing -> return Nothing
    Just l -> do
      ws <- createEvalWorkspace
      writeCode l r ws
      c <- compile l r ws
      e <- execute l r ws
      return $ Just (c, e)
