{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.CPlusPlus (cplusplus) where

import Evalso.Cruncher.Language (Language (..))

cplusplus :: Language
cplusplus = Language {
    codeFilename = "program.cc"
  , compileCommand = Just ["g++", "-Wall", "program.cc"]
  , compileTimeout = Just 3
  , runCommand = ["./a.out"]
  , runTimeout = 5
  , codemirror = "clike"
  , rpm = "gcc-c++"
  , displayName = "C++"
}
