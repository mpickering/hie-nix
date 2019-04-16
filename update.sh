#!/bin/sh

set -xe

# needed since that's how stack2nix finds compiler, etc
NIXPKGS_COMMIT=$(nix eval --raw "(builtins.fromJSON (builtins.readFile ./nixpkgs-src.json)).rev")
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs/archive/$NIXPKGS_COMMIT.tar.gz

STACK2NIX=$(nix-build -A stack2nix --no-out-link)/bin/stack2nix

COMMIT=62b806c4ff527ec661316a9b716bb424f01fc125
URL=https://github.com/mpickering/haskell-ide-engine.git

$STACK2NIX --revision $COMMIT $URL --stack-yaml=stack-8.6.4.yaml --verbose > ghc-8.6.nix
