#!/bin/bash

source config.sh

# Exit if not sudo
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

apt_install() {
for i in "$@"
  do 
     aptitude -y install $i || true;
  done
}

apt-get update
apt-get install -y aptitude
apt_install "python3 python3-pip python-setuptools"
sudo -H -u $USER pip install --user apt-smart || true
export PATH=$(python3 -c 'import site; print(site.USER_BASE + "/bin")'):$PATH
apt-smart -a
