{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.CPlusPlus (cplusplus) where

import Evalso.Cruncher.Language (Language (..))

cplusplus :: Language
cplusplus = Language {
    _codeFilename = "program.cc"
  , _compileCommand = Just ["g++", "-Wall", "program.cc"]
  , _compileTimeout = Just 3
  , _runCommand = ["./a.out"]
  , _runTimeout = 5
  , _codemirror = "clike"
  , _rpm = "gcc-c++"
  , _displayName = "C++"
}
