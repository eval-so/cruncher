{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Bash (bash) where

import Evalso.Cruncher.Language (Language (..))

bash :: Language
bash = Language {
    codeFilename = "program.sh"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["bash", "program.sh"]
  , runTimeout = 5
  , codemirror = "shell"
  , rpm = "bash"
  , displayName = "Bash"
}
