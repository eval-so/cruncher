{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.CSharp (csharp) where

import Evalso.Cruncher.Language (Language (..))

csharp :: Language
csharp = Language {
    codeFilename = "program.cs"
  , compileCommand = Just ["mcs", "program.cs"]
  , compileTimeout = Just 3
  , runCommand = ["mono", "program.exe"]
  , runTimeout = 5
  , codemirror = "clike"
  , rpm = "mono-core"
  , displayName = "C#"
}
