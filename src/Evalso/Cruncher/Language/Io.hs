{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Io (io) where

import Evalso.Cruncher.Language (Language (..))

io :: Language
io = Language {
    codeFilename = "program.io"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["io", "program.io"]
  , runTimeout = 5
  , codemirror = "io"
  , rpm = "Io-language"
  , displayName = "Io"
}
