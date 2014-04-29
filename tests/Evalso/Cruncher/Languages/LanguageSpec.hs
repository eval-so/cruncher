{-# LANGUAGE OverloadedStrings #-}
module Evalso.Cruncher.Languages.LanguageSpec where

import qualified Evalso.Cruncher.FinalResult as FR
import Evalso.Cruncher.SandboxResult
import Evalso.Cruncher.Request
import Evalso.Cruncher.SELinux
import Test.Hspec

spec :: Spec
spec = do
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
      -- Enjoy: http://rosettacode.org/wiki/Hello_world/Standard_error#Go
      finalResult <- runRequest $ Request "go" "package main\nimport (\"fmt\"; \"os\")\nfunc main() { fmt.Fprintln(os.Stdout, \"hello world!\") }" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Haskell" $ do
      finalResult <- runRequest $ Request "haskell" "module Main where\nmain = putStrLn \"hello world!\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Idris" $ do
      finalResult <- runRequest $ Request "idris" "module Main\nmain : IO ()\nmain = putStrLn \"hello world!\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Io" $ do
      finalResult <- runRequest $ Request "io" "\"hello world!\" println" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for JRuby18" $ do
      finalResult <- runRequest $ Request "jruby18" "puts 'hello world!'" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Java" $ do
      finalResult <- runRequest $ Request "java" "public class EvalSO { public static void main(String[] args) { System.out.println(\"hello world!\"); } }" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for LOLCODE" $ do
      finalResult <- runRequest $ Request "lolcode" "HAI 1.2\nCAN HAS STDIO?\nVISIBLE \"hello world!\"\nKTHXBYE" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Lua" $ do
      finalResult <- runRequest $ Request "lua" "print 'hello world!'" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Perl" $ do
      finalResult <- runRequest $ Request "perl" "print \"hello world!\n\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing
{-
    it "works for Perl6" $ do
      finalResult <- runRequest $ Request "perl6" "print \"hello world!\n\"" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing
-}
    it "works for Python2" $ do
      finalResult <- runRequest $ Request "python2" "print 'hello world!'" Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for Rust" $ do
      finalResult <- runRequest $ Request "rust" "fn main() { println(\"hello world!\"); }" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""


    it "works for SML" $ do
      finalResult <- runRequest $ Request "sml" "print \"hello world!\\n\";" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Scala" $ do
      finalResult <- runRequest $ Request "scala" "object EvalSO extends App { println(\"hello world!\") }" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

    it "works for Smalltalk" $ do
      finalResult <- runRequest $ Request "smalltalk" "Transcript show: 'hello world!'; cr." Nothing False Nothing
      let (Just e) = FR.run finalResult
          c        = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      c `shouldBe` Nothing

    it "works for VB.NET" $ do
      finalResult <- runRequest $ Request "vbnet" "Module HelloWorld\nSub Main()\nConsole.WriteLine(\"hello world!\")\nEnd Sub\nEnd Module" Nothing False Nothing
      let (Just e) = FR.run finalResult
          (Just c) = FR.compile finalResult
      stdout e `shouldBe` "hello world!\n"
      stderr c `shouldBe` ""

