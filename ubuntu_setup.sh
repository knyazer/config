#!/bin/bash

# Ubuntu 22.04 setup script, install all things neccessary for development

# Load some variables
source config.sh

# Exit if not sudo
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

apt_install() {
for i in "$@"
  do 
     aptitude -y install $i || true
 done
}

# Update & upgrade
apt-get update -y
apt-get install -y aptitude

# Update mirrors list
source ubuntu_mirrors_rank.sh

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
        python3-venv flatpak gnome-tweak-tool zsh git vim node wget gpg gh python-setuptools build-essential vlc || true

# qbittorrent - cute torrent client
add-apt-repository --yes ppa:qbittorrent-team/qbittorrent-stable &&
apt-get update &&
apt_install qbittorrent || true

# amberol - cute music player
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.bassi.Amberol || true

# vscode - text editor
source ubuntu_vscode_install.sh

# CLion - C/C++ IDE
snap install clion --classic || true

# Telegram desktop client
snap install telegram-desktop

# Spotify
snap install spotify

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
dpkg -i google-chrome-stable_current_amd64.deb || true
rm -f google-chrome-stable_current_amd64.deb || true

# Sublime - text editor
wget -O- https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | tee /usr/share/keyrings/sublimehq.gpg || true
echo 'deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt_install sublime-text || true

# Using prime-select to set default gpu to nvidia
prime-select nvidia || true

# git (github) setup
gh auth login
git config --global user.email $EMAIL
git config --global user.name $NAME

# Final logs
echo "You may want to run sudo update-alternatives --config x-terminal-emulator to set the correct terminal emulator (terminator)"
