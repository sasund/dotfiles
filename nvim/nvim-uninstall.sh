#!/bin/bash

# This script uninstalls Neovim and removes its configuration files.
# Usage: ./nvim-uninstall.sh

echo "Uninstalling Neovim... Have you run stow to remove the symlinks? If not, please do so first."
read -p "Are you sure you want to uninstall Neovim? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Uninstall cancelled."
    exit 1
fi

echo "Removing Neovim configuration files..."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

echo "Neovim and its configuration files have been removed."
`
