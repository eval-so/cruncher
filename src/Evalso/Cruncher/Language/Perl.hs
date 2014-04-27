{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Perl (perl) where

import Evalso.Cruncher.Language (Language (..))

perl :: Language
perl = Language {
    codeFilename = "program.pl"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["perl", "program.pl"]
  , runTimeout = 5
  , codemirror = "perl"
  , rpm = "perl"
  , displayName = "Perl"
}
