#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask font-jetbrains-mono

xargs brew install < homebrew/leaves.txt

curl -fsSL https://get.jetify.com/devbox | bash