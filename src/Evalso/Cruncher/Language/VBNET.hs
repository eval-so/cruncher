{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.VBNET (vbnet) where

import Evalso.Cruncher.Language (Language (..))

vbnet :: Language
vbnet = Language {
    codeFilename = "program.vb"
  , compileCommand = Just ["vbnc", "-nologo", "program.vb"]
  , compileTimeout = Just 3
  , runCommand = ["mono", "program.exe"]
  , runTimeout = 5
  , codemirror = "vbnet"
  , rpm = "mono-basic"
  , displayName = "VBNET"
}
