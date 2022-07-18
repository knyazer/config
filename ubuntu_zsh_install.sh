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
ZSH_THEME='pmcgee' # Comment this line if you experience problems with powerlevel10k
zstyle ':omz:update' mode auto
plugins=(git screen gh sudo zsh-navigation-tools copybuffer)
fpath+=${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export PATH=$HOME/.local/bin:$PATH
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Help function
function help {
    echo 'Some help here:
    Ctrl+O - save input to clipboard;
    Ctrl+R - history search;
    Esc Esc - sudo \!\!;
    Left arrow - accept autosuggestion;
    vpn up - connect to default vpn;
    vpn down - disconnect from default vpn;
    charge (0-100) - set the max charge percentage, I prefer 60 by default;
    '
}

# Some aliases
alias cls=clear
alias ll=ls -l
alias la=ls -la
alias t=todo.sh

# VPN controls
function vpn {
    wg-quick \$1 xeovo-nl
}

# tlp (battery) controls
function charge {
    tlp setcharge 0 \$1
}

" > $HOME/.zshrc || true

bash ubuntu_powerlevel10k_setup.sh || true