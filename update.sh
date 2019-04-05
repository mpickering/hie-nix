#!/bin/sh

set -xe

# needed since that's how stack2nix finds compiler, etc
NIXPKGS_COMMIT=$(nix eval --raw "(builtins.fromJSON (builtins.readFile ./nixpkgs-src.json)).rev")
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs/archive/$NIXPKGS_COMMIT.tar.gz

STACK2NIX=$(nix-build -A stack2nix --no-out-link)/bin/stack2nix

COMMIT=4ecb198dae595d9b4b21e8ecba32f87ca95526ab
URL=https://github.com/mpickering/haskell-ide-engine.git

$STACK2NIX --revision $COMMIT $URL --stack-yaml=stack.yaml > ghc-8.6.nix
