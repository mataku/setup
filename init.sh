#!/bin/bash -ex
MITAMAE_VERSION="1.6.3"

if [ ! $CI ]; then
  xcode-select --install
fi

mkdir -p ~/src/github.com/mataku
git clone https://github.com/mataku/mac-setup ~/src/github.com/mataku/mac-setup
curl -Lo mitamae-x86_64-darwin.tar.gz https://github.com/k0kubun/mitamae/releases/download/v${MITAMAE_VERSION}/mitamae-x86_64-darwin.tar.gz
tar -zxf mitamae-x86_64-darwin.tar.gz
rm mitamae-x86_64-darwin.tar.gz
chmod +x mitamae-x86_64-darwin
mkdir bin && mv mitamae-x86_64-darwin bin/mitamae
echo y | bin/mitamae local ~/src/github.com/mataku/mac-setup/recipes/all.rb -y ~/src/github.com/mataku/mac-setup/nodes/mac.yml --log-level=DEBUG
