#!/bin/bash -ex
MITAMAE_VERSION="1.6.3"

if [ ! $CI ] && [ $(uname) = 'Darwin' ]; then
  xcode-select --install
fi

if [ $(uname) = 'Darwin' ]; then
  suffix="darwin"
else
  suffix="linux"
fi

if [ ! $CI ]; then
  mkdir -p ~/src/github.com/mataku
  git clone https://github.com/mataku/setup ~/src/github.com/mataku/setup
  cd ~/src/github.com/mataku/setup
fi

curl -Lo mitamae.tar.gz https://github.com/itamae-kitchen/mitamae/releases/download/v${MITAMAE_VERSION}/mitamae-x86_64-$suffix.tar.gz
tar -zxf mitamae.tar.gz
rm mitamae.tar.gz
chmod +x mitamae-x86_64-$suffix
mkdir bin && mv mitamae-x86_64-$suffix bin/mitamae
echo y | bin/mitamae local ./recipes/all.rb -y ./nodes/mac.yml --log-level=DEBUG

if [ ! $CI ]; then
  cd -
fi
