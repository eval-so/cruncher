{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Smalltalk (smalltalk) where

import Evalso.Cruncher.Language (Language (..))

smalltalk :: Language
smalltalk = Language {
    _codeFilename = "program.st"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["gst", "program.st"]
  , _runTimeout = 5
  , _codemirror = "smalltalk"
  , _rpm = "gnu-smalltalk"
  , _displayName = "Smalltalk"
}
