{-# LANGUAGE OverloadedStrings #-}
module Evalso.Cruncher.JSONSpec where

import qualified Evalso.Cruncher.FinalResult as FR
import Evalso.Cruncher.SandboxResult
import Evalso.Cruncher.Request
import Evalso.Cruncher.SELinux

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as C8
import Data.Maybe (isJust)
import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "Result" $ do
    it "is encodable as JSON" $ do
      finalResult <- runRequest $ Request "c++" "#include <iostream>\nusing namespace std; int main() { cout << \"hello world!\" << endl; }" Nothing False Nothing
      let ejson    = encode (FR.run finalResult)
          cjson    = encode (FR.compile finalResult)
          ejsonDec = decode ejson :: Maybe SandboxResult
          cjsonDec = decode cjson :: Maybe SandboxResult

      (C8.unpack ejson) `shouldSatisfy` (not . null)
      (C8.unpack cjson) `shouldSatisfy` (not . null)
      ejsonDec `shouldSatisfy` isJust
      cjsonDec `shouldSatisfy` isJust
      let (Just x) = ejsonDec
        in stdout x `shouldBe` "hello world!\n"
