{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Java (java) where

import Evalso.Cruncher.Language (Language (..))

java :: Language
java = Language {
    codeFilename = "program.java"
  , compileCommand = Just ["javac", "program.java"]
  , compileTimeout = Just 3
  , runCommand = ["java", "EvalSO"]
  , runTimeout = 5
  , codemirror = "java"
  , rpm = "java"
  , displayName = "Java"
}
