{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.JRuby18 (jruby18) where

import Evalso.Cruncher.Language (Language (..))

jruby18 :: Language
jruby18 = Language {
    codeFilename = "program.rb"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["jruby", "--headless", "--1.8", "program.rb"]
  , runTimeout = 10
  , codemirror = "ruby"
  , rpm = "jruby"
  , displayName = "JRuby18"
}
