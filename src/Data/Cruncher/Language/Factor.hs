{-# LANGUAGE OverloadedStrings, Safe #-}

module Data.Cruncher.Language.Factor (factor) where

import Data.Cruncher.Language (Language (..))

factor :: Language
factor = Language {
    codeFilename = "program.factor"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["factor-vm", "program.factor"]
  , runTimeout = 5
  , codemirror = "factor" -- ^ TODO: Doesn't seem to exist upstream.
  , rpm = "factor"
  , displayName = "Factor"
}
