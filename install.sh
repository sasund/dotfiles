#!/usr/bin/env bash

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask font-jetbrains-mono

xargs brew install < homebrew/leaves.txt

# Nix
sh <(curl -L https://nixos.org/nix/install)

# Devbox
curl -fsSL https://get.jetify.com/devbox | bash