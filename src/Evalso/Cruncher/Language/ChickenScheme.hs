{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.ChickenScheme (chickenscheme) where

import Evalso.Cruncher.Language (Language (..))

chickenscheme :: Language
chickenscheme = Language {
    _codeFilename = "program.scm"
  , _compileCommand = Just ["csc", "-o", "a.out", "program.scm"]
  , _compileTimeout = Just 3
  , _runCommand = ["./a.out"]
  , _runTimeout = 5
  , _codemirror = "scheme"
  , _rpm = "chicken"
  , _displayName = "Chicken Scheme"
}
