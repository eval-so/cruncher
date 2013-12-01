{-# LANGUAGE Safe #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : stable

module Data.Cruncher.Language (Language (..)) where

import qualified Data.Text as T

-- | Describes what a programming language looks like internally.
data Language = Language {
    extension :: String
  , codeFilename :: String
  , compileCommand :: Maybe [T.Text]
  , binaryFilename :: Maybe String
  , compileTimeout :: Maybe Int
  , runCommand :: [T.Text]
  , runTimeout :: Int
} deriving (Eq, Show)
