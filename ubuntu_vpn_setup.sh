#!/bin/bash

source misc.sh

# Correct rights
chown root:root -R /etc/wireguard && chmod 600 -R /etc/wireguard || true

# Here you might want to put the name of the server you like
wg-quick up xeovo-nl || true
systemctl enable wg-quick@xeovo-nl || true