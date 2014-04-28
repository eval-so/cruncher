{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Scala (scala) where

import Evalso.Cruncher.Language (Language (..))

scala :: Language
scala = Language {
    _codeFilename = "EvalSO.scala"
  , _compileCommand = Just ["scalac", "EvalSO.scala"]
  , _compileTimeout = Just 10
  , _runCommand = ["scala", "EvalSO"]
  , _runTimeout = 10
  , _codemirror = "scala"
  , _rpm = "scala"
  , _displayName = "Scala"
}
