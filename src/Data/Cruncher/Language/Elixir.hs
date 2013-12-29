{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.Elixir (elixir) where

import Data.Cruncher.Language (Language (..))

elixir :: Language
elixir = Language {
    codeFilename = "program.exs"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["elixir", "program.exs"]
  , runTimeout = 5
  , codemirror = "elixir" -- TODO - This doesn't seem to exist upstream yet.
  , rpm = "elixir"
  , displayName = "Elixir"
}
