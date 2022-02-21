#!/usr/bin/env bash

sudo apt-get install -y curl zsh git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo chsh -s $(which zsh)
