{-# LANGUAGE OverloadedStrings, Trustworthy #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : experimental

module Evalso.Cruncher.Language (Language (..)) where

import Data.Aeson
import qualified Data.Text as T

-- | Describes what a programming language looks like internally.
data Language = Language {
    codeFilename :: String -- ^ What to store the incoming file as.
  , compileCommand :: Maybe [T.Text] -- ^ What to compile with.
  , compileTimeout :: Maybe Int -- ^ How many seconds to give the compilation before timeout.
  , runCommand :: [T.Text] -- ^ What to run with.
  , runTimeout :: Int -- ^ How many seconds to give the compilation before timeout.
  , codemirror :: String -- ^ How does this get highlighted in CodeMirror?
  , rpm :: String -- ^ Which RPM provides this? Used for summary/version only.
  , displayName :: String -- ^ How should this language be displayed in UIs?
} deriving (Eq, Show)

instance ToJSON Language where
  toJSON (Language codeFilename' compileCommand' compileTimeout' runCommand' runTimeout' codemirror' rpm' displayName') = object
    [
      "codeFilename"   .= codeFilename'
    , "compileCommand" .= compileCommand'
    , "compileTimeout" .= compileTimeout'
    , "runCommand"     .= runCommand'
    , "runTimeout"     .= runTimeout'
    , "codemirror"     .= codemirror'
    , "rpm"            .= rpm'
    , "displayName"    .= displayName'
    ]
