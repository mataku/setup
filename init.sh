#!/bin/bash -ex
MITAMAE_VERSION="1.12.4"

if [ ! $CI ] && [ $(uname) = 'Darwin' ]; then
  xcode-select --install
fi

if [ $(uname) = 'Darwin' ]; then
  suffix="darwin"
else
  suffix="linux"
fi

if [ $(uname -m) = 'x86_64' ]; then
  arch="x86_64"
else
  arch="aarch64"
fi

binary=mitamae-$arch-$suffix

if [ ! $CI ]; then
  mkdir -p ~/src/github.com/mataku
  git clone https://github.com/mataku/setup ~/src/github.com/mataku/setup
  cd ~/src/github.com/mataku/setup
fi

curl -Lo mitamae.tar.gz https://github.com/itamae-kitchen/mitamae/releases/download/v${MITAMAE_VERSION}/$binary.tar.gz
tar -zxf mitamae.tar.gz
rm mitamae.tar.gz
chmod +x $binary
mkdir -p bin && mv $binary bin/mitamae
echo y | bin/mitamae local ./recipes/all.rb -y ./nodes/mac.yml --log-level=DEBUG

if [ ! $CI } ]; then
  cd -
fi
