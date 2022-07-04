#!/bin/bash

source config.sh

# Zsh configuration
chsh -s $(which zsh) || true
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh || true
RUNZSH='no' sh install.sh || true
rm -r install.sh

echo "export ZSH='$HOME/.oh-my-zsh'
ZSH_THEME='gallois'
zstyle ':omz:update' mode auto
plugins=(git)
source /home/$USER/.oh-my-zsh/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export PATH=$(python3 -c 'import site; print(site.USER_BASE + \"/bin\")'):$PATH" > /home/$USER/.zshrc || true

