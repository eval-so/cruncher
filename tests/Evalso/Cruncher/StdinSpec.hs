{-# LANGUAGE OverloadedStrings #-}
module Evalso.Cruncher.StdinSpec where

import qualified Evalso.Cruncher.FinalResult as FR
import Evalso.Cruncher.Request
import Evalso.Cruncher.SandboxResult
import Evalso.Cruncher.SELinux

import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "An evaluation" $ do
    it "processes the standard input stream correctly" $ do
      finalResult <- runRequest $ Request "ruby" "puts STDIN.gets" Nothing False (Just "hello world")
      let (Just x) = FR.run finalResult
      stdout x `shouldBe` "hello world\n"
