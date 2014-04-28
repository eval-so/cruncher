{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.VBNET (vbnet) where

import Evalso.Cruncher.Language (Language (..))

vbnet :: Language
vbnet = Language {
    _codeFilename = "program.vb"
  , _compileCommand = Just ["vbnc", "-nologo", "program.vb"]
  , _compileTimeout = Just 3
  , _runCommand = ["mono", "program.exe"]
  , _runTimeout = 5
  , _codemirror = "vbnet"
  , _rpm = "mono-basic"
  , _displayName = "VBNET"
}
