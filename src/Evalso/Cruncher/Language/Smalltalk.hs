{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Smalltalk (smalltalk) where

import Evalso.Cruncher.Language (Language (..))

smalltalk :: Language
smalltalk = Language {
    codeFilename = "program.st"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["gst", "program.st"]
  , runTimeout = 5
  , codemirror = "smalltalk"
  , rpm = "gnu-smalltalk"
  , displayName = "Smalltalk"
}
