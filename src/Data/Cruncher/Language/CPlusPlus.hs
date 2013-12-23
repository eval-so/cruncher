{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.CPlusPlus (cplusplus) where

import Data.Cruncher.Language (Language (..))

cplusplus :: Language
cplusplus = Language {
    runTimeout = 5
  , extension = "cc"
  , codeFilename = "program.cc"
  , binaryFilename = Just "a.out"
  , compileCommand = Just ["g++", "-Wall", "program.cc"]
  , compileTimeout = Just 5
  , runCommand = ["./a.out"]
  , codemirror = "clike"
}
