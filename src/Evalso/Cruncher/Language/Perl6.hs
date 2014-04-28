{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Perl6 (perl6) where

import Evalso.Cruncher.Language (Language (..))

perl6 :: Language
perl6 = Language {
    _codeFilename = "program.pl"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["perl6", "program.pl"]
  , _runTimeout = 5
  , _codemirror = "perl6"
  , _rpm = "rakudo-star"
  , _displayName = "Perl6"
}
