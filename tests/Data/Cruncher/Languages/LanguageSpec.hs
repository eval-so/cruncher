{-# LANGUAGE OverloadedStrings #-}
module Data.Cruncher.Languages.LanguageSpec where

import Data.Cruncher.Result
import Data.Cruncher.Request
import Data.Cruncher.SELinux
import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "Sandboxed evaluation" $ do
    it "works for C++" $ do
      (Just ((Just c), (Just e))) <- runRequest $ Request "c++" "#include <iostream>\nusing namespace std; int main() { cout << \"hello world!\" << endl; }" Nothing False Nothing
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for C" $ do
      (Just ((Just c), (Just e))) <- runRequest $ Request "c" "#include <stdio.h>\nint main() { printf(\"hello world!\\\n\"); return 0; }\n" Nothing False Nothing
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for PHP" $ do
      (Just (c, (Just e))) <- runRequest $ Request "php" "<?php echo 'hello world!';" Nothing False Nothing
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Ruby" $ do
      (Just (c, (Just e))) <- runRequest $ Request "ruby" "puts 'hello world!';" Nothing False Nothing
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing
