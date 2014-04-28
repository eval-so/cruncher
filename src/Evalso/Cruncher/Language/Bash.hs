{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Bash (bash) where

import Evalso.Cruncher.Language (Language (..))

bash :: Language
bash = Language {
    _codeFilename = "program.sh"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["bash", "program.sh"]
  , _runTimeout = 5
  , _codemirror = "shell"
  , _rpm = "bash"
  , _displayName = "Bash"
}
