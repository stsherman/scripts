#!/usr/bin/env bash

cd ~/Themes/WhiteSur-gtk-theme

./install.sh -c dark -i ubuntu
sudo ./tweaks.sh -g -d -c dark -b default -i ubuntu -e -f

cd ~/Themes/WhiteSur-icon-theme
./install.sh

busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'
