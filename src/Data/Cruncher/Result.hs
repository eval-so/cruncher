{-# LANGUAGE OverloadedStrings, Trustworthy #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : stable

module Data.Cruncher.Result (Result (..)) where

import Control.Applicative
import Control.Monad (mzero)
import Data.Aeson hiding (Result)
import Data.Text (Text)

-- | Describes the result we get back after performing an evaluation (or
--   compilation). This is almost always wrapped in 'IO'.
data Result = Result {
    stdout      :: Text
  , stderr      :: Text
  , wallTime    :: Int
  , exitCode    :: Int
} deriving (Eq, Show)

instance ToJSON Result where
  toJSON (Result stdout' stderr' wallTime' exitCode') = object
    [
      "stdout"      .= stdout'
    , "stderr"      .= stderr'
    , "wallTime"    .= wallTime'
    , "exitCode"    .= exitCode'
    ]

instance FromJSON Result where
  parseJSON (Object v) = Result <$>
                             v .: "stdout"
                         <*> v .: "stderr"
                         <*> v .: "wallTime"
                         <*> v .: "exitCode"
  parseJSON _          = mzero
