#!/bin/bash

#silence output
SS="> /dev/null 2>&1"

set -e

echo "           -- Welcome to the --"
echo "    █████████"
echo "   ███░░░░░███"
echo "  ░███    ░███  ████████   ██████   █████"
echo "  ░███████████ ░░███░░███ ███░░███ ███░░"
echo "  ░███░░░░░███  ░███ ░░░ ░███████ ░░█████"
echo "  ░███    ░███  ░███     ░███░░░   ░░░░███"
echo "  █████   █████ █████    ░░██████  ██████"
echo " ░░░░░   ░░░░░ ░░░░░      ░░░░░░  ░░░░░░"
echo "           -- Post-Installer --"

sleep 3

echo "adding zen browser plugin... please following along"
#zen browser mods
wget -q --show-progress https://github.com/CosmoCreeper/Sine/releases/download/v2.2.3/sine-flatpak.sh
sleep 1   # > /dev/null 2>&1
chmod +x sine-flatpak.sh  # > /dev/null 2>&1
sudo ./sine-flatpak.sh 
sleep 1
rm sine-flatpak.sh
echo "done [✓]"

sleep 3

echo "installing spicetify.."
#install spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh  
echo 'export PATH=$PATH:~/.spicetify' >> ~/.bashrc # > /dev/null 2>&1
source ~/.bashrc # > /dev/null 2>&1
sleep 2
spicetify config spotify_path "$(flatpak --installations)/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify"   # > /dev/null 2>&1
spicetify config prefs_path /home/username/.var/app/com.spotify.Client/config/spotify/prefs # > /dev/null 2>&1
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify   # > /dev/null 2>&1
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps   # > /dev/null 2>&1
spicetify backup   # > /dev/null 2>&1
spicetify update   # > /dev/null 2>&1
echo "done [✓]"

echo "Creating snapshot"
sudo timeshift --create $SS
echo "update done [✓]"
echo "remeber to set up backup scheduel..."
sleep 3

echo "DONE!"
echo "any errors with the stow command? fix it and rerun it."