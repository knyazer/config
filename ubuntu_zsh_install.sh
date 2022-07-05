#!/bin/bash

source config.sh

# Zsh configuration
chsh -s $(which zsh) || true
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh || true
RUNZSH='no' sh install.sh || true
rm -r install.sh

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USER/.zsh/zsh-autosuggestions || true

# .zshrc
echo "export ZSH='$HOME/.oh-my-zsh'
ZSH_THEME='pmcgee'
zstyle ':omz:update' mode auto
plugins=(git screen gh sudo zsh-navigation-tools copybuffer)
source /home/$USER/.oh-my-zsh/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export PATH=/home/$USER/.local/bin:$PATH
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
echo 'Some help here:
Ctrl+O - save input to clipboard;
Ctrl+A - history search;
Esc Esc - sudo !!;
Left arrow - accept autosuggestion;'" > /home/$USER/.zshrc || true
