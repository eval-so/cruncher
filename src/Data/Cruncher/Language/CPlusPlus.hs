{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.CPlusPlus (cplusplus) where

import Data.Cruncher.Language (Language (..))

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
