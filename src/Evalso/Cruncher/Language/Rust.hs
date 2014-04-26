{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Rust (rust) where

import Evalso.Cruncher.Language (Language (..))

rust :: Language
rust = Language {
    codeFilename = "program.rs"
  , compileCommand = Just ["rust", "build", "-o", "a.out", "program.rs"]
  , compileTimeout = Just 3
  , runCommand = ["./a.out"]
  , runTimeout = 5
  , codemirror = "rust"
  , rpm = nil
  , displayName = "Rust"
}
