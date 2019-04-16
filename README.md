[![Cachix](https://img.shields.io/badge/cachix-hie--nix-blue.svg)](https://hie-nix.cachix.org)
[![Build Status](https://travis-ci.org/domenkozar/hie-nix.svg?branch=master)](https://travis-ci.org/domenkozar/hie-nix)

# Purpose

The purpose of this repository is to provide [HIE](https://github.com/haskell/haskell-ide-engine)
for each major GHC version installable via Nix.

Hie built with specific GHC needs to match the major version of GHC used on development project.

# Temporary install


```
cachix use mpickering
nix run -f https://github.com/mpickering/hie-nix/tarball/master hie86
```


# Updating HIE

    # edit commit in update.sh
    $ ./update.sh

# FAQ

## How do I make editor integrate the right hie version?

Install `hies` which will include all supported GHC versions and the wrapper supported
by most editors.


## How do I integrate my editor?

See https://github.com/haskell/haskell-ide-engine#editor-integration

## Does hie-nix work with Stack?

Yes, but make sure you have Nix enabled in either `stack.yaml` in your project or globally:

    $ cat ~/.stack/config.yaml
    nix:
      enable: true

