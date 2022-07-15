#!/bin/bash

# Installs powerlevel10k for zsh of the current user

source config.sh

# Download newest powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k || true
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc || true

# Copy and enable the powerlevel10k config to $HOME
cp .p10k.zsh ~/
echo 'source ~/.p10k.zsh' >>~/.zshrc || true