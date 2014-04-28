{-# LANGUAGE OverloadedStrings #-}

module Evalso.Cruncher.Unsandboxed (version) where

import Evalso.Cruncher.Language (Language, rpm)

import Control.Applicative
import Control.Lens
import qualified Data.Text as T
import qualified Shelly as S

version :: Language -> IO T.Text
version l = S.shelly $ S.silently $
  T.strip <$> S.run "rpm" ["-qv", T.pack (l ^. rpm)]
