{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.LOLCODE (lolcode) where

import Evalso.Cruncher.Language (Language (..))

lolcode :: Language
lolcode = Language {
    _codeFilename = "program.lol"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["lci", "program.lol"]
  , _runTimeout = 5
  , _codemirror = "lolcode"
  , _rpm = "lci"
  , _displayName = "LOLCODE"
}
