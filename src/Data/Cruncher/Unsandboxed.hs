{-# LANGUAGE OverloadedStrings #-}

module Data.Cruncher.Unsandboxed (version) where

import Data.Cruncher.Language (Language, rpm)

import Control.Applicative
import qualified Data.Text as T
import qualified Shelly as S

version :: Language -> IO T.Text
version l = S.shelly $ S.silently $
  T.strip <$> S.run "rpm" ["-qv", T.pack (rpm l)]
