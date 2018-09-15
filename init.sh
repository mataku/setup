#!/bin/bash -ex
MITAMAE_VERSION="1.6.3"

curl -Lo mitamae-x86_64-darwin.tar.gz https://github.com/k0kubun/mitamae/releases/download/v${MITAMAE_VERSION}/mitamae-x86_64-darwin.tar.gz
tar -zxf mitamae-x86_64-darwin.tar.gz
chmod +x mitamae-x86_64-darwin
mkdir bin && ln -sf mitamae-x86_64-darwin.tar.gz bin/mitamae

echo y | bin/mitamae local recipes/all.rb -y nodes/mac.yml
