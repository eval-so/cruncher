{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Idris (idris) where

import Evalso.Cruncher.Language (Language (..))

idris :: Language
idris = Language {
    codeFilename = "program.idr"
  , compileCommand = Just ["idris", "-o", "program", "program.idr"]
  , compileTimeout = Just 5
  , runCommand = ["./program"]
  , runTimeout = 5
  , codemirror = "idris"
  , rpm = "idris"
  , displayName = "Idris"
}
