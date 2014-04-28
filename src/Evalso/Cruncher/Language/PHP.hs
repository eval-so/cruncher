{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.PHP (php) where

import Evalso.Cruncher.Language (Language (..))

php :: Language
php = Language {
    _codeFilename = "program.php"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["php", "program.php"]
  , _runTimeout = 5
  , _codemirror = "php"
  , _rpm = "php"
  , _displayName = "PHP"
}
