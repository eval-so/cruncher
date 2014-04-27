{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Scala (scala) where

import Evalso.Cruncher.Language (Language (..))

scala :: Language
scala = Language {
    codeFilename = "EvalSO.scala"
  , compileCommand = Just ["scalac", "EvalSO.scala"]
  , compileTimeout = Just 10
  , runCommand = ["scala", "EvalSO"]
  , runTimeout = 10
  , codemirror = "scala"
  , rpm = "scala"
  , displayName = "Scala"
}
