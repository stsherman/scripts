#!/usr/bin/env bash

# Install dependencies
sudo apt update
sudo apt install git build-essential libsdl2-dev libepoxy-dev libpixman-1-dev libgtk-3-dev libssl-dev libsamplerate0-dev libpcap-dev ninja-build

# Clone and build
git clone https://github.com/mborgerson/xemu.git
cd xemu
./build.sh

# Run
./dist/xemu
