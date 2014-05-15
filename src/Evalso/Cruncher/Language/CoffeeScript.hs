{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.CoffeeScript (coffeescript) where

import Evalso.Cruncher.Language (Language (..))

coffeescript :: Language
coffeescript = Language {
    _codeFilename = "program.coffee"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["coffee", "program.coffee"]
  , _runTimeout = 5
  , _codemirror = "coffee"
  , _rpm = "coffee-script"
  , _displayName = "CoffeeScript"
}
