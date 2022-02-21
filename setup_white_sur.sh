#!/usr/bin/env bash

# Install gnome-tweaks
# Install these extensions
# https://extensions.gnome.org/extension/307/dash-to-dock/
# https://extensions.gnome.org/extension/19/user-themes/
# https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/
# https://extensions.gnome.org/extension/2935/control-blur-effect-on-lock-screen/

# TODO: Move these to separate file
# https://extensions.gnome.org/extension/1065/docker-status/
# https://extensions.gnome.org/extension/841/freon/
# https://extensions.gnome.org/extension/921/multi-monitors-add-on/
# https://extensions.gnome.org/extension/104/netspeed/
# https://extensions.gnome.org/extension/4328/shortcuts-for-apt/
# https://extensions.gnome.org/extension/906/sound-output-device-chooser/

sudo apt-get install gnome-tweaks

# Install gtk theme and apply tweaks
cd ~/Themes/WhiteSur-gtk-theme
./install.sh -c dark -i ubuntu
sudo ./tweaks.sh -g -d -c dark -b default -i ubuntu -f monterey

# Install icons
cd ~/Themes/WhiteSur-icon-theme
./install.sh

# Install wallpapers
cd ~/Themes/WhiteSur-gtx-theme-wallpapers
./install-gnome-backgrounds.sh

busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'

gnome-tweaks
echo "In the Tweaks tool, go to Appearance and update the following:"
echo "\tApplications=WhiteSur-dark"
echo "\tIcons=WhiteSur-dark"
echo "\tShell=WhiteSur-dark"

echo "Go to Extensions and disable Ubuntu dock"
