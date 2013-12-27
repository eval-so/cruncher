{-# LANGUAGE OverloadedStrings #-}
module Data.Cruncher.StdinSpec where

import qualified Data.Cruncher.FinalResult as FR
import Data.Cruncher.Request
import Data.Cruncher.Result
import Data.Cruncher.SELinux

import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "An evaluation" $ do
    it "processes the standard input stream correctly" $ do
      finalResult <- runRequest $ Request "ruby" "puts STDIN.gets" Nothing False (Just "hello world")
      let (Just x) = FR.run finalResult
      stdout x `shouldBe` "hello world\n"
