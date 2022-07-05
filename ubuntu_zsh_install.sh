#!/bin/bash

source config.sh

# Zsh configuration
chsh -s $(which zsh) || true
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh || true
RUNZSH='no' sh install.sh || true
rm -r install.sh

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions || true

# Advanced completion
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions

# .zshrc
echo "export ZSH='$HOME/.oh-my-zsh'
ZSH_THEME='pmcgee'
zstyle ':omz:update' mode auto
plugins=(git screen gh sudo zsh-navigation-tools copybuffer)
fpath+=${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export PATH=$HOME/.local/bin:$PATH
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
function help () {
    echo 'Some help here:
    Ctrl+O - save input to clipboard;
    Ctrl+R - history search;
    Esc Esc - sudo !!;
    Left arrow - accept autosuggestion;'
}
" > $HOME/.zshrc || true
