#!/bin/bash

# Installs and configures tlp, battery control tool. Used to prolong battery life on laptops.

source misc.sh

add-apt-repository ppa:linrunner/tlp || true
apt_install tlp acpi-call-dkms tp-smapi-dkms || true
change_config_field_value /usr/share/tlp/defaults.conf USB_AUTOSUSPEND 0

# Also copy the entire tlp config file
cp -f tlp.conf /etc

# Disable default thingy as it breaks everything
sudo systemctl disable power-profiles-daemon.service || true

systemctl enable tlp.service || true
tlp start || true

