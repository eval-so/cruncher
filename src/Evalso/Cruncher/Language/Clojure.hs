{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Clojure (clojure) where

import Evalso.Cruncher.Language (Language (..))

-- TODO: Improve Clojure runtime speeds. I've not managed <15s in the sandbox. -@duckinator
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
  , _runTimeout = 20
  , _codemirror = "clojure"
  , _rpm = "clojure"
  , _displayName = "Clojure"
}
