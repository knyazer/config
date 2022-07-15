#!/bin/bash

# Installs todo-cli script

# force sudo
source misc.sh

# Download source code
git clone https://github.com/todotxt/todo.txt-cli
cd todo.txt-cli

# Build
make
make install CONFIG_DIR=/etc INSTALL_DIR=/usr/bin BASH_COMPLETION=/usr/share/bash-completion/completions

# Remove
cd ..
rm -rf todo.txt-cli