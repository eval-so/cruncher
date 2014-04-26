{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Python2 (python2) where

import Evalso.Cruncher.Language (Language (..))

python2 :: Language
python2 = Language {
    codeFilename = "program.py"
  , compileCommand = Nothing
  , compileTimeout = Nothing
  , runCommand = ["python2", "program.py"]
  , runTimeout = 5
  , codemirror = "python2"
  , rpm = "python"
  , displayName = "Python2"
}
