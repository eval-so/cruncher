{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.FSharp (fsharp) where

import Evalso.Cruncher.Language (Language (..))

fsharp :: Language
fsharp = Language {
    codeFilename = "program.fs"
  , compileCommand = Just ["fsharpc", "--nologo", "-o", "a.exe", "program.fs"]
  , compileTimeout = Just 8
  , runCommand = ["mono", "a.exe"]
  , runTimeout = 5
  , codemirror = "fsharp" -- TODO - Doesn't seem to exist upstream.
  , rpm = "fsharp"
  , displayName = "F#"
}
