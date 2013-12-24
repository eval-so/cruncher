{-# LANGUAGE OverloadedStrings #-}
module Data.Cruncher.JSONSpec where

import qualified Data.Cruncher.FinalResult as FR
import Data.Cruncher.Result
import Data.Cruncher.Request
import Data.Cruncher.SELinux

import Data.Aeson hiding (Result)
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
          ejsonDec = decode ejson :: Maybe Result
          cjsonDec = decode cjson :: Maybe Result

      (C8.unpack ejson) `shouldSatisfy` (not . null)
      (C8.unpack cjson) `shouldSatisfy` (not . null)
      ejsonDec `shouldSatisfy` isJust
      cjsonDec `shouldSatisfy` isJust
      let (Just x) = ejsonDec
        in stdout x `shouldBe` "hello world!\n"