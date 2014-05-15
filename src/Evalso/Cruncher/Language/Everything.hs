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
import Evalso.Cruncher.Language.CoffeeScript as L
import Evalso.Cruncher.Language.CSharp as L
import Evalso.Cruncher.Language.Elixir as L
import Evalso.Cruncher.Language.Factor as L
import Evalso.Cruncher.Language.FSharp as L
import Evalso.Cruncher.Language.Go as L
import Evalso.Cruncher.Language.Haskell as L
import Evalso.Cruncher.Language.Idris as L
import Evalso.Cruncher.Language.Io as L
import Evalso.Cruncher.Language.Java as L
import Evalso.Cruncher.Language.JavaScript as L
import Evalso.Cruncher.Language.JRuby18 as L
import Evalso.Cruncher.Language.LOLCODE as L
import Evalso.Cruncher.Language.Lua as L
import Evalso.Cruncher.Language.Perl6 as L
import Evalso.Cruncher.Language.Perl as L
import Evalso.Cruncher.Language.PHP as L
import Evalso.Cruncher.Language.Python2 as L
import Evalso.Cruncher.Language.Ruby as L
import Evalso.Cruncher.Language.Rust as L
import Evalso.Cruncher.Language.Scala as L
import Evalso.Cruncher.Language.Smalltalk as L
import Evalso.Cruncher.Language.SML as L
import Evalso.Cruncher.Language.VBNET as L

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
  , ("coffeescript", coffeescript)
  , ("csharp", csharp)
  , ("elixir", elixir)
  , ("factor", factor)
  , ("fsharp", fsharp)
  , ("go", go)
  , ("haskell", haskell)
  , ("idris", idris)
  , ("io", io)
  , ("java", java)
  , ("javascript", javascript)
  , ("jruby18", jruby18)
  , ("lolcode", lolcode)
  , ("lua", lua)
  , ("perl6", perl6)
  , ("perl", perl)
  , ("php", php)
  , ("python2", python2)
  , ("ruby", ruby)
  , ("rust", rust)
  , ("scala", scala)
  , ("smalltalk", smalltalk)
  , ("sml", sml)
  , ("vbnet", vbnet)
  ]
