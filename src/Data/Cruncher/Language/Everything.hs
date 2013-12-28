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
import Data.Cruncher.Language.Bash as L
import Data.Cruncher.Language.C as L
import Data.Cruncher.Language.ChickenScheme as L
import Data.Cruncher.Language.CPlusPlus as L
import Data.Cruncher.Language.Clojure as L
import Data.Cruncher.Language.CSharp as L
import Data.Cruncher.Language.Elixir as L
import Data.Cruncher.Language.Factor as L
import Data.Cruncher.Language.FSharp as L
import Data.Cruncher.Language.PHP as L
import Data.Cruncher.Language.Ruby as L

-- | A map of languages, by name.
--
--   Effective use of this map requires importing 'Data.Map.lookup' and using
--   it to get a 'Maybe' 'Language'
languages :: Map String Language
languages = Map.fromList
  [
    ("bash", bash)
  , ("c++", cplusplus)
  , ("c", c)
  , ("chickenscheme", chickenscheme)
  , ("clojure", clojure)
  , ("csharp", csharp)
  , ("elixir", elixir)
  , ("factor", factor)
  , ("fsharp", fsharp)
  , ("php", php)
  , ("ruby", ruby)
  ]
