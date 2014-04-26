{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.LOLCODE (lolcode) where

import Evalso.Cruncher.Language (Language (..))

lolcode :: Language
lolcode = Language {
    codeFilename = "program.lol"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["lci", "program.lol"]
  , runTimeout = 5
  , codemirror = "lolcode"
  , rpm = "lci"
  , displayName = "LOLCODE"
}
