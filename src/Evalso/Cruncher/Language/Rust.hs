{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Rust (rust) where

import Evalso.Cruncher.Language (Language (..))

rust :: Language
rust = Language {
    _codeFilename = "program.rs"
  , _compileCommand = Just ["rust", "build", "-o", "a.out", "program.rs"]
  , _compileTimeout = Just 3
  , _runCommand = ["./a.out"]
  , _runTimeout = 5
  , _codemirror = "rust"
  , _rpm = "rust" -- TODO: Figure out if the package is actually called "rust."
  , _displayName = "Rust"
}
