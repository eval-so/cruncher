{-# LANGUAGE Safe #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : stable, changes with new languages

module Evalso.Cruncher.Language.Everything (
    languages
  , module L
) where

import Data.Map (Map)
import qualified Data.Map as Map

import Evalso.Cruncher.Language (Language (..))

-- Language imports here.
import Evalso.Cruncher.Language.Bash as L
import Evalso.Cruncher.Language.C as L
import Evalso.Cruncher.Language.ChickenScheme as L
import Evalso.Cruncher.Language.CPlusPlus as L
import Evalso.Cruncher.Language.Clojure as L
import Evalso.Cruncher.Language.CSharp as L
import Evalso.Cruncher.Language.Elixir as L
import Evalso.Cruncher.Language.Factor as L
import Evalso.Cruncher.Language.FSharp as L
import Evalso.Cruncher.Language.PHP as L
import Evalso.Cruncher.Language.Ruby as L

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
