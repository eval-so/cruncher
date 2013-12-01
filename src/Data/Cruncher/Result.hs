{-# LANGUAGE Safe #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : stable

module Data.Cruncher.Result (Result (..)) where

import Data.Text (Text)

-- | Describes the result we get back after performing an evaluation (or
--   compilation). This is almost always wrapped in 'IO'.
data Result = Result {
    stdout      :: Text
  , stderr      :: Text
  , wallTime    :: Int
  , exitCode    :: Int
  , outputFiles :: [(String, Text)]
} deriving (Eq, Show)
