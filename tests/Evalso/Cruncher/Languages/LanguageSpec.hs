{-# LANGUAGE OverloadedStrings #-}
module Evalso.Cruncher.Languages.LanguageSpec where

import qualified Evalso.Cruncher.FinalResult as FR
import Evalso.Cruncher.SandboxResult
import Evalso.Cruncher.Request
import Evalso.Cruncher.SELinux
import Test.Hspec

spec :: Spec
spec = parallel $ do
  describe "Sandboxed evaluation" $ do
    it "works for C++" $ do
      finalResult <- runRequest $ Request "c++" "#include <iostream>\nusing namespace std; int main() { cout << \"hello world!\" << endl; }" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
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

{-
    it "works for Factor" $ do
      finalResult <- runRequest $ Request "factor" "USE: io\n\"hello world!\" print" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing
-}

    it "works for Bash" $ do
      finalResult <- runRequest $ Request "bash" "echo 'hello world!'" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

{-
    it "works for C#" $ do
      finalResult <- runRequest $ Request "csharp" "public class HelloWorld { public class void Main() { System.Console.WriteLine(\"hello world!\"); } }" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""
-}

    it "works for Chicken Scheme" $ do
      finalResult <- runRequest $ Request "chickenscheme" "(print \"hello world!\")" Nothing False Nothing
      let (Just e) = FR.run finalResult
      stdout e `shouldBe` "hello world!\n"

{-
    it "works for Elixir" $ do
      finalResult <- runRequest $ Request "elixir" "IO.puts \"hello world!\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Clojure" $ do
      finalResult <- runRequest $ Request "clojure" "(print \"hello world!\")" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing
-}

    it "works for F#" $ do
      finalResult <- runRequest $ Request "fsharp" "printfn \"hello world!\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Go" $ do
      finalResult <- runRequest $ Request "go" "println(\"hello, world!\")" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Haskell" $ do
      finalResult <- runRequest $ Request "haskell" "putStrLn \"hello, world!\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""
{-
    it "works for Idris" $ do
      finalResult <- runRequest $ Request "idris" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Io" $ do
      finalResult <- runRequest $ Request "io" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for JRuby18" $ do
      finalResult <- runRequest $ Request "jruby18" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Java" $ do
      finalResult <- runRequest $ Request "java" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for LOLCODE" $ do
      finalResult <- runRequest $ Request "lolcode" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Lua" $ do
      finalResult <- runRequest $ Request "lua" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Perl" $ do
      finalResult <- runRequest $ Request "perl" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Perl6" $ do
      finalResult <- runRequest $ Request "perl6" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Python2" $ do
      finalResult <- runRequest $ Request "python2" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Rust" $ do
      finalResult <- runRequest $ Request "rust" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for SML" $ do
      finalResult <- runRequest $ Request "sml" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Scala" $ do
      finalResult <- runRequest $ Request "scala" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Smalltalk" $ do
      finalResult <- runRequest $ Request "smalltalk" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for VBNET" $ do
      finalResult <- runRequest $ Request "vbnet" "" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""
-}
