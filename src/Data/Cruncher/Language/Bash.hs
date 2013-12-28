{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.Bash (bash) where

import Data.Cruncher.Language (Language (..))

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
