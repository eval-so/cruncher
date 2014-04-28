{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Java (java) where

import Evalso.Cruncher.Language (Language (..))

java :: Language
java = Language {
    _codeFilename = "EvalSO.java"
  , _compileCommand = Just ["javac", "EvalSO.java"]
  , _compileTimeout = Just 10
  , _runCommand = ["java", "EvalSO"]
  , _runTimeout = 10
  , _codemirror = "java"
  , _rpm = "java-devel"
  , _displayName = "Java"
}
