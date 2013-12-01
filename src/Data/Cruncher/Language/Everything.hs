{-# LANGUAGE Safe #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : stable, changes with new languages

module Data.Cruncher.Language.Everything (
    languages
  , module L
) where

import Data.Map (Map)
import qualified Data.Map as Map

import Data.Cruncher.Language (Language (..))

-- Language imports here.
import Data.Cruncher.Language.C as L
import Data.Cruncher.Language.CPlusPlus as L
import Data.Cruncher.Language.PHP as L
import Data.Cruncher.Language.Ruby as L

-- | A map of languages, by name.
--
--   Effective use of this map requires importing 'Data.Map.lookup' and using
--   it to get a 'Maybe' 'Language'
languages :: Map String Language
languages = Map.fromList
  [
    ("c++", cplusplus)
  , ("c", c)
  , ("php", php)
  , ("ruby", ruby)
  ]
