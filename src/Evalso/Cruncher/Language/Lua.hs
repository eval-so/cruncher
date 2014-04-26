{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Lua (lua) where

import Evalso.Cruncher.Language (Language (..))

lua :: Language
lua = Language {
    codeFilename = "program.lua"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["lua", "program.lua"]
  , runTimeout = 5
  , codemirror = "lua"
  , rpm = "lua"
  , displayName = "Lua"
}
