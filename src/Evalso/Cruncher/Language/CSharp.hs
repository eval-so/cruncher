{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.CSharp (csharp) where

import Evalso.Cruncher.Language (Language (..))

csharp :: Language
csharp = Language {
    _codeFilename = "program.cs"
  , _compileCommand = Just ["mcs", "program.cs"]
  , _compileTimeout = Just 3
  , _runCommand = ["mono", "program.exe"]
  , _runTimeout = 5
  , _codemirror = "clike"
  , _rpm = "mono-core"
  , _displayName = "C#"
}
