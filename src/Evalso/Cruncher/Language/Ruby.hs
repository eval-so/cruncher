{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Ruby (ruby) where

import Evalso.Cruncher.Language (Language (..))

ruby :: Language
ruby = Language {
    codeFilename = "program.rb"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["ruby", "program.rb"]
  , runTimeout = 5
  , codemirror = "ruby"
  , rpm = "ruby"
  , displayName = "Ruby"
}
