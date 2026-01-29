#!/bin/bash

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
echo "             -- Installer --"              

sleep 3

echo "disableing screen saver and sleep while installing"

gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

echo "updating system..."
#update system
sudo apt update && sudo apt upgrade -y > /dev/null 2>&1
echo "update done [✓]"

echo "installing basic packages..."
#install packages
sudo apt install -y curl unrar git fzf fd-find eza bat zsh btop cargo cava flatpak timeshift fastfetch fonts-font-awesome zoxide luarocks tealdeer ripgrep stow make cmake > /dev/null 2>&1
echo "done [✓]"

echo "adding flatpak and installing packages..."
#install flatpak packages
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo > /dev/null 2>&1
flatpak install -y com.spotify.Client app.zen_browser.zen com.valvesoftware.Steam com.vscodium.codium > /dev/null 2>&1
echo "done [✓]"

echo "building neovim from source..."
#install neovim
git clone https://github.com/neovim/neovim  > /dev/null 2>&1
cd neovim 
make CMAKE_BUILD_TYPE=RelWithDebInfo > /dev/null 2>&1
sudo make install > /dev/null 2>&1
cd -
rm -rf ./neovim
echo "done [✓]"

echo "installing icon package..."
#icon pack
wget -qO- https://git.io/papirus-icon-theme-install | sh > /dev/null 2>&1
echo "done [✓]"

echo "installing starship..."
#install starship
curl -sS https://starship.rs/install.sh | sh
echo "done [✓]"
sleep 2

echo "installing jetbrains mono font..."
#install font jetbrains mono 
mkdir ~/.fonts
sleep 1
wget -q --show-progress -P ~/.fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip -o ~/.fonts/JetBrainsMono.zip -d ~/.fonts/
rm ~/.fonts/JetBrainsMono.zip
echo "done [✓]"

echo "Downloading wallpapperpack..."
mkdir ~/walls  # > /dev/null 2>&1
sleep 1
wget -q --show-progress -P ~/walls/ https://github.com/JustAdumbPrsn/Zen-Nebula/releases/download/v3.1/Wallpapers.rar
sleep 2
unrar x ~/walls/Wallpapers.rar ~/walls/
rm ~/walls/Wallpapers.rar
echo "update done [✓]"

echo "staring dank shell materials intaller..."
#install dms
curl -fsSL https://install.danklinux.com | sh
echo "done [✓]"
sleep 5

echo "changing shell to zsh..."
#change shell
chsh -s $(which zsh)   #  # > /dev/null 2>&1
echo "done [✓]"

echo "once rebooted run post-install.sh..."
sleep 2
echo "reenabling screen saver and sleep"
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300
echo "restaring system in 10 sec..."
sleep 9
echo "see you soon!"
sleep 1
sudo reboot