{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.SML (sml) where

import Evalso.Cruncher.Language (Language (..))

sml :: Language
sml = Language {
    _codeFilename = "program.sml"
  , _compileCommand = Just ["mlton", "-output", "a.out", "program.sml"]
  , _compileTimeout = Just 5
  , _runCommand = ["./a.out"]
  , _runTimeout = 10
  , _codemirror = "sml"
  , _rpm = "mlton"
  , _displayName = "SML"
}
