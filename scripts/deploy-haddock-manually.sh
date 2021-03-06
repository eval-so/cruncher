#!/usr/bin/env bash

cwd="$( cd "${BASH_SOURCE[0]%/*}" && pwd )"
cd "$cwd/.."
cabal haddock
f=`mktemp -d`
git clone git@github.com:eval-so/cruncher.git "$f/cruncher.git"
pushd "$f/cruncher.git"
  git checkout gh-pages
  git rm -rf docs
popd
mv dist/doc/html/cruncher/ "$f/cruncher.git/docs"
pushd "$f/cruncher.git"
  git add -A
  git commit -m "Manual docs deploy."
  git push origin gh-pages
popd
rm -rf "$f"

if [ $? == 0 ]; then
  echo "*** Done: http://eval-so.github.io/cruncher/docs/"
  exit 0
else
  echo "*** ERROR!!! Fix the above and try again."
  exit 1
fi
