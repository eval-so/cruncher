{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.C (c) where

import Data.Cruncher.Language (Language (..))

c :: Language
c = Language {
    codeFilename = "program.c"
  , compileCommand = Just ["gcc", "-Wall", "program.c"]
  , compileTimeout = Just 3
  , runCommand = ["./a.out"]
  , runTimeout = 5
  , codemirror = "clike"
  , rpm = "gcc"
  , displayName = "C"
}
