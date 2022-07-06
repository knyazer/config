#!/bin/bash

# Installs and configures tlp, battery control tool. Used to prolong battery life on laptops.

source misc.sh

add-apt-repository ppa:linrunner/tlp || true
apt_install tlp acpi-call-dkms tp-smapi-dkms || true
systemctl enable tlp.service || true
tlp setcharge 0 60 || true
tlp start || true