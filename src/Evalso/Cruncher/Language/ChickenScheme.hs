{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.ChickenScheme (chickenscheme) where

import Evalso.Cruncher.Language (Language (..))

chickenscheme :: Language
chickenscheme = Language {
    codeFilename = "program.scm"
  , compileCommand = Just ["csc", "-o", "a.out", "program.scm"]
  , compileTimeout = Just 3
  , runCommand = ["./a.out"]
  , runTimeout = 5
  , codemirror = "scheme"
  , rpm = "chicken"
  , displayName = "Chicken Scheme"
}
