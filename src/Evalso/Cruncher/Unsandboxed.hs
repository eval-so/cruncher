{-# LANGUAGE OverloadedStrings #-}

module Evalso.Cruncher.Unsandboxed (version) where

import Evalso.Cruncher.Language (Language, rpm)

import Control.Lens
import qualified Data.Text as T
import qualified Shelly as S

version :: Language -> IO (Maybe T.Text)
version l = S.shelly . S.errExit False . S.silently $ do
  versionOut <- S.run "rpm" ["-qv", T.pack (l ^. rpm)]
  exitCode <- S.lastExitCode
  return $ if exitCode == 0
           then Just . T.strip $ versionOut
           else Nothing
