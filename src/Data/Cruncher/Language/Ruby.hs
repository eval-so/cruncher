{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.Ruby (ruby) where

import Data.Cruncher.Language (Language (..))

ruby :: Language
ruby = Language {
    runTimeout = 5
  , extension = "rb"
  , codeFilename = "program.rb"
  , binaryFilename = Nothing
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["ruby", "program.rb"]
}
