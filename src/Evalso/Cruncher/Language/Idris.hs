{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Idris (idris) where

import Evalso.Cruncher.Language (Language (..))

idris :: Language
idris = Language {
    _codeFilename = "program.idr"
  , _compileCommand = Just ["idris", "-o", "program", "program.idr"]
  , _compileTimeout = Just 5
  , _runCommand = ["./program"]
  , _runTimeout = 5
  , _codemirror = "idris"
  , _rpm = "idris"
  , _displayName = "Idris"
}
