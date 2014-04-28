{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Perl (perl) where

import Evalso.Cruncher.Language (Language (..))

perl :: Language
perl = Language {
    _codeFilename = "program.pl"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["perl", "program.pl"]
  , _runTimeout = 5
  , _codemirror = "perl"
  , _rpm = "perl"
  , _displayName = "Perl"
}
