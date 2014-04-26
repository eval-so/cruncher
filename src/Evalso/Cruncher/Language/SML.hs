{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.SML (sml) where

import Evalso.Cruncher.Language (Language (..))

sml :: Language
sml = Language {
    codeFilename = "program.sml"
  , compileCommand = Just ["mlton", "-output", "a.out", "program.sml"]
  , compileTimeout = Just 3
  , runCommand = ["./a.out"]
  , runTimeout = 10
  , codemirror = "sml"
  , rpm = "mlton"
  , displayName = "SML"
}
