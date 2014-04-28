{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Lua (lua) where

import Evalso.Cruncher.Language (Language (..))

lua :: Language
lua = Language {
    _codeFilename = "program.lua"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["lua", "program.lua"]
  , _runTimeout = 5
  , _codemirror = "lua"
  , _rpm = "lua"
  , _displayName = "Lua"
}
