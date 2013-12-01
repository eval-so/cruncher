{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.PHP (php) where

import Data.Cruncher.Language (Language (..))

php :: Language
php = Language {
    runTimeout = 5
  , extension = "php"
  , codeFilename = "program.php"
  , binaryFilename = Nothing
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["php", "program.php"]
}
