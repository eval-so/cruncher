{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Go (go) where

import Evalso.Cruncher.Language (Language (..))

go :: Language
go = Language {
    _codeFilename = "program.go"
  , _compileCommand = Just ["go", "build", "program.go"]
  , _compileTimeout = Just 3
  , _runCommand = ["./program"]
  , _runTimeout = 5
  , _codemirror = "go"
  , _rpm = "go"
  , _displayName = "Go"
}
