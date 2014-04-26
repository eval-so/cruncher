{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Go (go) where

import Evalso.Cruncher.Language (Language (..))

go :: Language
go = Language {
    codeFilename = "program.go"
  , compileCommand = Just ["go", "build", "program.go"]
  , compileTimeout = Just 3
  , runCommand = ["s\"./${filename.replaceAll(\"\\\\.go$\"", "\")}"]
  , runTimeout = 5
  , codemirror = "go"
  , rpm = "golang"
  , displayName = "Go"
}
