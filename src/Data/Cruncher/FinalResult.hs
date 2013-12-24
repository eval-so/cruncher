{-# LANGUAGE OverloadedStrings, Trustworthy #-}
-- |
-- Maintainer  : Ricky Elrod <ricky@elrod.me>
-- Stability   : stable

-- | The final result for a given request.
--
--   This contains the 'Result' obtained from both evaluation and compilation
--   as well as any files which resulted from performing the above steps.
--   Such files should placed in @~/output/@ of the evaluation.
module Data.Cruncher.FinalResult (FinalResult (..)) where

import Data.Cruncher.Result

import Control.Applicative
import Control.Monad (mzero)
import Data.Aeson hiding (Result)
import Data.ByteString (ByteString)
import Data.Map (Map)

data FinalResult
  = FinalResult
    {
      compile     :: Maybe Result -- ^ The compilation result, if any
    , run         :: Maybe Result -- ^ The execution result, if any
    , outputFiles :: Map String ByteString -- ^ Base64-encoded output files.
    }
  | NoSuchLanguage
  | SELinuxNotEnforcing
  deriving (Eq, Show)

instance ToJSON FinalResult where
  toJSON (FinalResult compile' run' outputFiles') = object
    [
      "compile"     .= compile'
    , "run"         .= run'
    , "outputFiles" .= outputFiles'
    ]

  -- | TODO: i18n
  toJSON (NoSuchLanguage) = object ["error" .= noSuchLanguageError]
    where
      noSuchLanguageError :: String
      noSuchLanguageError = "We do not currently support that language"

  -- | TODO: i18n
  toJSON (SELinuxNotEnforcing) = object ["error" .= selinuxError]
    where
      selinuxError :: String
      selinuxError = "Internal security error - halting request"

instance FromJSON FinalResult where
  parseJSON (Object v) = FinalResult <$>
                             v .: "compile"
                         <*> v .: "run"
                         <*> v .: "outputFiles"
  parseJSON _          = mzero
