{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Haskell (haskell) where

import Evalso.Cruncher.Language (Language (..))

haskell :: Language
haskell = Language {
    codeFilename = "program.hs"
  , compileCommand = Just ["ghc", "program.hs"]
  , compileTimeout = Just 3
  , runCommand = ["./program"]
  , runTimeout = 5
  , codemirror = "haskell"
  , rpm = "ghc-compiler"
  , displayName = "Haskell"
}
