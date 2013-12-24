{-# LANGUAGE OverloadedStrings #-}
module Data.Cruncher.Languages.LanguageSpec where

import qualified Data.Cruncher.FinalResult as FR
import Data.Cruncher.Result
import Data.Cruncher.Request
import Data.Cruncher.SELinux
import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "Sandboxed evaluation" $ do
    it "works for C++" $ do
      finalResult <- runRequest $ Request "c++" "#include <iostream>\nusing namespace std; int main() { cout << \"hello world!\" << endl; }" Nothing False Nothing
      let (Just e) = FR.run finalResult
      let (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for C" $ do
      finalResult <- runRequest $ Request "c" "#include <stdio.h>\nint main() { printf(\"hello world!\\\n\"); return 0; }\n" Nothing False Nothing
      let (Just e) = FR.run finalResult
      let (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for PHP" $ do
      finalResult <- runRequest $ Request "php" "<?php echo 'hello world!';" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Ruby" $ do
      finalResult <- runRequest $ Request "ruby" "puts 'hello world!';" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing
