{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.PHP (php) where

import Data.Cruncher.Language (Language (..))

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
