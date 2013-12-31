{-# LANGUAGE OverloadedStrings #-}
module Evalso.Cruncher.Base64Spec where

import qualified Evalso.Cruncher.FinalResult as FR
import Evalso.Cruncher.Request
import Evalso.Cruncher.SELinux

import qualified Data.Map as Map
import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "An output file produced by an evaluation" $ do
    it "is decodable from valid base64" $ do
      finalResult <- runRequest $ Request "ruby" "File.open('output/foobar', 'w').tap{|x|x.write('I am decoded!')}.flush" Nothing False Nothing
      Map.member "foobar" (FR.outputFiles finalResult) `shouldBe` True
      let (Just x) = Map.lookup "foobar" (FR.outputFiles finalResult)
      x `shouldBe` "SSBhbSBkZWNvZGVkIQ=="
