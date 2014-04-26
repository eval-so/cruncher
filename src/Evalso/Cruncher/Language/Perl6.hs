{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Perl6 (perl6) where

import Evalso.Cruncher.Language (Language (..))

perl6 :: Language
perl6 = Language {
    codeFilename = "program.pl"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["perl6", "program.pl"]
  , runTimeout = 5
  , codemirror = "perl6"
  , rpm = "rakudo-star"
  , displayName = "Perl6"
}
