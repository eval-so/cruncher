{-# LANGUAGE OverloadedStrings #-}
module Evalso.Cruncher.Base64Spec where

import qualified Evalso.Cruncher.FinalResult as FR
import Evalso.Cruncher.Request
import qualified Evalso.Cruncher.SandboxResult as SR
import Evalso.Cruncher.SELinux

import qualified Data.Map as Map
import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "An output file produced by an evaluation" $ do
    it "is decodable from valid base64" $ do
      finalResult <- runRequest $ Request "ruby" "File.open('output/run/foobar', 'w').tap{|x|x.write('I am decoded!')}.flush" Nothing False Nothing
      let (Just x) = FR.run finalResult
      Map.member "foobar" (SR.outputFiles x) `shouldBe` True
      let (Just y) = Map.lookup "foobar" (SR.outputFiles x)
      y `shouldBe` "SSBhbSBkZWNvZGVkIQ=="
