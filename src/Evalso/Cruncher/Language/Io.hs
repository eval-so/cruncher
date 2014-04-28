{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Io (io) where

import Evalso.Cruncher.Language (Language (..))

io :: Language
io = Language {
    _codeFilename = "program.io"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["io", "program.io"]
  , _runTimeout = 5
  , _codemirror = "io"
  , _rpm = "Io-language"
  , _displayName = "Io"
}
