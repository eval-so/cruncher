{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Java (java) where

import Evalso.Cruncher.Language (Language (..))

java :: Language
java = Language {
    codeFilename = "program.java"
  , compileCommand = Just ["javac", "program.java"]
  , compileTimeout = Just 10
  , runCommand = ["java", "EvalSO"]
  , runTimeout = 10
  , codemirror = "java"
  , rpm = "java"
  , displayName = "Java"
}
