#!/bin/bash

# Ubuntu 22.04 setup script, install all things neccessary for development

# Load some variables
source config.sh

# Some functions for installation & init scripts
source misc.sh

# Update mirrors list
bash ubuntu_mirrors_rank.sh || true

# Upgrade all the packages
apt upgrade -y

# htop - resource monitor
# neofetch - system info
# clang, lldb, lld - LLVM (C/C++ modern build/compile/etc tools)
# aptitude - better then apt, automatically resolves problems
# terminator - cute terminal emulator
# base-devel - bunch of stuff for the development
# flatpak - package manager & launcher
# gnome-tweak-tool - advanced gnome settings
# zsh - advanced shell
# vim - console editor
# gh - github cli
apt_install htop neofetch docker clang lldb lld curl aptitude terminator base-devel cmake node python3.10 python3-pip \
        python3-venv flatpak gnome-tweak-tool zsh git vim node wget gpg gh python-setuptools build-essential vlc openresolv \
        wireguard xclip openjdk-8-jdk openjdk-17-jdk openjdk-17-jre gnome-tweaks || true

# qbittorrent - cute torrent client
add-apt-repository --yes ppa:qbittorrent-team/qbittorrent-stable &&
apt-get update &&
apt_install qbittorrent || true

# amberol - cute music player
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.bassi.Amberol || true

# vscode - text editor
bash ubuntu_vscode_install.sh || true

# CLion - C/C++ IDE
snap install clion --classic || true

# Telegram desktop client
snap install telegram-desktop

# Spotify
snap install spotify

# Discord
snap install discord

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
dpkg -i google-chrome-stable_current_amd64.deb || true
rm -f google-chrome-stable_current_amd64.deb || true

# Sublime - text editor
wget -O- https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | tee /usr/share/keyrings/sublimehq.gpg || true
echo 'deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/' | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt_install sublime-text || true

# Using prime-select to set default gpu to nvidia
prime-select nvidia || true

# git (github) setup
gh auth login
git config --global user.email $EMAIL
git config --global user.name $NAME

# zsh for root
bash ubuntu_zsh_install.sh || true

# zsh for user
sudo -H -u $USER bash ubuntu_zsh_install || true

# Charging controls configuration
bash ubuntu_battery_control_setup.sh || true

# Wireguard autostart config
read -p "You have to add the wireguard vpn keys to the /etc/wireguard. After you do that, press any key to continue. Otherwise, press ctrl+c to exit installer"
bash ubuntu_vpn_setup.sh || true