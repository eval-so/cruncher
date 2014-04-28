{-# LANGUAGE OverloadedStrings, Safe #-}

module Evalso.Cruncher.Language.Python2 (python2) where

import Evalso.Cruncher.Language (Language (..))

python2 :: Language
python2 = Language {
    _codeFilename = "program.py"
  , _compileCommand = Nothing
  , _compileTimeout = Nothing
  , _runCommand = ["python2", "program.py"]
  , _runTimeout = 5
  , _codemirror = "python2"
  , _rpm = "python"
  , _displayName = "Python2"
}
