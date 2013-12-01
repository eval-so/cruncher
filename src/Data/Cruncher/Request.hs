{-# LANGUAGE Safe #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : probably somewhat stable

module Data.Cruncher.Request (Request (..)) where

import Control.Monad ((>>=))
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
