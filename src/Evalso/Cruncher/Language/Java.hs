{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Java (java) where

import Evalso.Cruncher.Language (Language (..))

java :: Language
java = Language {
    codeFilename = "EvalSO.java"
  , compileCommand = Just ["javac", "EvalSO.java"]
  , compileTimeout = Just 10
  , runCommand = ["java", "EvalSO"]
  , runTimeout = 10
  , codemirror = "java"
  , rpm = "java-devel"
  , displayName = "Java"
}
