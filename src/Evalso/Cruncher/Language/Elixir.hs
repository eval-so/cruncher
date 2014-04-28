{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Elixir (elixir) where

import Evalso.Cruncher.Language (Language (..))

elixir :: Language
elixir = Language {
    _codeFilename = "program.exs"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["elixir", "program.exs"]
  , _runTimeout = 5
  , _codemirror = "elixir" -- TODO - This doesn't seem to exist upstream yet.
  , _rpm = "elixir"
  , _displayName = "Elixir"
}
