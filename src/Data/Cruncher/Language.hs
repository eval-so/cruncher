{-# LANGUAGE Safe #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : experimental

module Data.Cruncher.Language (Language (..)) where

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
