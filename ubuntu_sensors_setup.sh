#!/bin/bash

# Temperature sensors automatic setup & configuration

source misc.sh

source config.sh

apt-get update

apt_install lm-sensors

sensors-detect --auto

apt_install psensor