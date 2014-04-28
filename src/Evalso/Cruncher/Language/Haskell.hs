{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Haskell (haskell) where

import Evalso.Cruncher.Language (Language (..))

haskell :: Language
haskell = Language {
    _codeFilename = "program.hs"
  , _compileCommand = Just ["ghc", "program.hs"]
  , _compileTimeout = Just 3
  , _runCommand = ["./program"]
  , _runTimeout = 5
  , _codemirror = "haskell"
  , _rpm = "ghc-compiler"
  , _displayName = "Haskell"
}
