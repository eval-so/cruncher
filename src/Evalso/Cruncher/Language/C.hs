{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.C (c) where

import Evalso.Cruncher.Language (Language (..))

c :: Language
c = Language {
    _codeFilename = "program.c"
  , _compileCommand = Just ["gcc", "-Wall", "program.c"]
  , _compileTimeout = Just 3
  , _runCommand = ["./a.out"]
  , _runTimeout = 5
  , _codemirror = "clike"
  , _rpm = "gcc"
  , _displayName = "C"
}
