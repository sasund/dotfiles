#!/usr/bin/env bash

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask font-jetbrains-mono
brew install --cask hyperkey
brew install --cask raycast
brew install --cask ghostty
brew install --cask warp

brew install --cask google-chrome
brew install --cask intellij-idea


xargs brew install < homebrew/leaves.txt

# Nix
sh <(curl -L https://nixos.org/nix/install)

# Devbox
curl -fsSL https://get.jetify.com/devbox | bash

#git clone https://github.com/DevOpsHiveHQ/kubech ~/.kubech

# Atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
