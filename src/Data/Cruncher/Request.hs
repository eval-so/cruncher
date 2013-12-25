{-# LANGUAGE OverloadedStrings, Trustworthy #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : probably somewhat stable
--
-- Handles incoming requests (usually from our Yesod frontend, but could be
-- from anywhere).

module Data.Cruncher.Request (Request (..)) where

import Control.Applicative
import Control.Monad (mzero)
import Data.Aeson hiding (Result)
import qualified Data.ByteString.Char8 as C8
import qualified Data.Text as T

-- | Describes an incoming request to the system. Proper use of this will
--   normally lead to some kind of a 'IO' 'Result'.
data Request = Request {
    language    :: String
  , code        :: T.Text
  , files       :: Maybe [(String, C8.ByteString)]
  , compileOnly :: Bool
  , stdin       :: Maybe T.Text
} deriving (Eq, Show)

instance FromJSON Request where
  parseJSON (Object v) = Request <$>
                             v .:  "language"
                         <*> v .:  "code"
                         <*> v .:? "inputFiles"
                         <*> v .:? "compilationOnly" .!= False
                         <*> v .:? "stdin"
  parseJSON _          = mzero
