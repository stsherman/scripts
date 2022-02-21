#!/usr/bin/env bash

sudo apt-get install -y pkg-config \
  python3 \
  libgirepository1.0-dev \
  meson \
  ninja-build \
  appstream-util \
  libusb-1.0-0-dev \
  libudev-dev \
  python3-pip \
  gir1.2-appindicator3-0.1 \
  gnome-shell-extension-appindicator

cd ~/Developer/Git

if [ ! -d "gkraken" ]; then
  # gkraken has not been cloned in this directory, clone it
  git clone --recurse-submodules -j4 https://gitlab.com/leinardi/gkraken.git
fi

cd gkraken

if ! command -v gkraken &> /dev/null
then
  # gkraken not installed, install it
  git checkout release
  sudo -H pip3 install -r requirements.txt
  meson . build --prefix /usr
  ninja -v -C build
  sudo ninja -v -C build install
else
  # gkraken is installed, update it
  git fetch
  git checkout release
  git reset --hard origin/release
  git submodule init
  git submodule update
  sudo -H pip3 install -r requirements.txt
  meson . build --prefix /usr
  ninja -v -C build
  sudo ninja -v -C build install
  sudo gkraken --add-udev-rule
fi
