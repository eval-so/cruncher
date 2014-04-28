{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Ruby (ruby) where

import Evalso.Cruncher.Language (Language (..))

ruby :: Language
ruby = Language {
    _codeFilename = "program.rb"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["ruby", "program.rb"]
  , _runTimeout = 5
  , _codemirror = "ruby"
  , _rpm = "ruby"
  , _displayName = "Ruby"
}
