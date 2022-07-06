#!/bin/bash

# Ranks the repository mirrors. Might speedup the downloading of apt packages.

source config.sh
source misc.sh

apt_install python3 python3-pip python-setuptools
pip install --user apt-smart || true
export PATH=$(python3 -c 'import site; print(site.USER_BASE + "/bin")'):$PATH
apt-smart -a