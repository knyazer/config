#!/bin/bash

# Collection of useful functions and aptitude installation. Also checks if you are root

# Exit if not root
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

# Update + install aptitude
apt-get update -y
apt-get install -y aptitude

# Function to install package ignoring every error
apt_install() {
for i in "$@"
  do 
     aptitude -y install $i || true
 done
}