#!/usr/bin/env bash
# Ricky Elrod <ricky@elrod.me>
# Deploy the haddock docs to gh-pages, via travis-ci
# Mostly a port of http://awestruct.org/auto-deploy-to-github-pages/

pushd "$TRAVIS_BUILD_DIR"

cabal haddock

if [ $TRAVIS_PULL_REQUEST != "" ]; then
  echo "PR: Only building haddock docs, not deploying."
  exit 0
fi

cp -r dist/doc/html/cruncher/ ~/docs

cd ~

# Deploy key.
mkdir -p .ssh
chmod 700 .ssh
curl -sLo .ssh/id_rsa.gpg "https://$SITE/$KEY"
cd .ssh
echo "$PW1" | gpg --passphrase-fd=0 id_rsa.gpg
chmod 600 .ssh/id_rsa

echo "Host github.com" > ~/.ssh/config
echo "  StrictHostKeyChecking no" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config

git clone git@github.com:eval-so/cruncher cruncher-tmp
cd cruncher-tmp
git checkout gh-pages
git config user.name "$GIT_NAME"
git config user.email "$GIT_EMAIL"
git rm -rf docs
mv ~/docs .
git add .
git commit -m "Automatic documentation deployment"
git push origin gh-pages
shred -uv ~/.ssh/id_rsa
popd
