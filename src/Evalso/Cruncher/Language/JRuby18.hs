{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.JRuby18 (jruby18) where

import Evalso.Cruncher.Language (Language (..))

jruby18 :: Language
jruby18 = Language {
    _codeFilename = "program.rb"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["jruby", "--headless", "--1.8", "program.rb"]
  , _runTimeout = 10
  , _codemirror = "ruby"
  , _rpm = "jruby"
  , _displayName = "JRuby18"
}
