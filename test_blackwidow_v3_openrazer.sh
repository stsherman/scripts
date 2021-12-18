#!/bin/bash

# clone the repo and cd to it
git clone -b blackwidowv3prowireless https://github.com/GeoDoX/openrazer.git

cd openrazer

sudo apt install debhelper dh-python linux-headers-generic python3-setuptools lsb-release dkms # build dependencies

./scripts/build_debs.sh

sudo apt install ./dist/*.deb

# add user to the plugdev group
sudo gpasswd -a "$USER" plugdev

