{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.Ruby (ruby) where

import Data.Cruncher.Language (Language (..))

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
