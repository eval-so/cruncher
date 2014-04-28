{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Factor (factor) where

import Evalso.Cruncher.Language (Language (..))

factor :: Language
factor = Language {
    _codeFilename = "program.factor"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["factor-vm", "program.factor"]
  , _runTimeout = 5
  , _codemirror = "factor" -- TODO - Doesn't seem to exist upstream.
  , _rpm = "factor"
  , _displayName = "Factor"
}
