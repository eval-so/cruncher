{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Clojure (clojure) where

import Evalso.Cruncher.Language (Language (..))

clojure :: Language
clojure = Language {
    _codeFilename = "program.clj"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = [
    "java",
    "-client",
    "-XX:+TieredCompilation",
    "-XX:TieredStopAtLevel=1",
    "-Xbootclasspath/a:/usr/share/java/clojure.jar",
    "clojure.main",
    "program.clj"
    ]
  , _runTimeout = 10
  , _codemirror = "clojure"
  , _rpm = "clojure"
  , _displayName = "Clojure"
}
