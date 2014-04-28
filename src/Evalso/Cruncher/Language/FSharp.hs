{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.FSharp (fsharp) where

import Evalso.Cruncher.Language (Language (..))

fsharp :: Language
fsharp = Language {
    _codeFilename = "program.fs"
  , _compileCommand = Just ["fsharpc", "--nologo", "-o", "a.exe", "program.fs"]
  , _compileTimeout = Just 8
  , _runCommand = ["mono", "a.exe"]
  , _runTimeout = 5
  , _codemirror = "fsharp" -- TODO - Doesn't seem to exist upstream.
  , _rpm = "fsharp"
  , _displayName = "F#"
}
