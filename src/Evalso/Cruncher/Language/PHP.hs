{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.PHP (php) where

import Evalso.Cruncher.Language (Language (..))

php :: Language
php = Language {
    codeFilename = "program.php"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["php", "program.php"]
  , runTimeout = 5
  , codemirror = "php"
  , rpm = "php"
  , displayName = "PHP"
}
