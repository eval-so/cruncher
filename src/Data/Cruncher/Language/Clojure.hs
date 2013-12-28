{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.Clojure (clojure) where

import Data.Cruncher.Language (Language (..))

clojure :: Language
clojure = Language {
    codeFilename = "program.clj"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = [
    "java",
    "-client",
    "-XX:+TieredCompilation",
    "-XX:TieredStopAtLevel=1",
    "-Xbootclasspath/a:/usr/share/java/clojure.jar",
    "clojure.main",
    "program.clj"
    ]
  , runTimeout = 10
  , codemirror = "clojure"
  , rpm = "clojure"
  , displayName = "Clojure"
}
