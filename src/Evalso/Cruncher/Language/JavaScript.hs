{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.JavaScript (javascript) where

import Evalso.Cruncher.Language (Language (..))

javascript :: Language
javascript = Language {
    _codeFilename = "program.js"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["node", "program.js"]
  , _runTimeout = 5
  , _codemirror = "javascript"
  , _rpm = "nodejs"
  , _displayName = "JavaScript"
}
