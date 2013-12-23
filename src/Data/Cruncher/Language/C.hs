{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.C (c) where

import Data.Cruncher.Language (Language (..))

c :: Language
c = Language {
    runTimeout = 5
  , extension = "c"
  , codeFilename = "program.c"
  , binaryFilename = Just "a.out"
  , compileCommand = Just ["gcc", "-Wall", "program.c"]
  , compileTimeout = Just 5
  , runCommand = ["./a.out"]
  , codemirror = "clike"
}
