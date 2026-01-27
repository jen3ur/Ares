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
echo "             -- Installer --"              

sleep 3

echo "updating system..."
#update system
sudo apt update && sudo apt upgrade $SS
echo "update done [✓]"

echo "installing basic packages..."
#install packages
sudo apt install -y git fzf fd-find eza bat zsh btop cargo cava flatpak timeshift fastfetch fonts-font-awesome zoxide luarocks tealdeer ripgrep stow $SS
echo "done [✓]"

echo "adding flatpak and installing packages..."
#install flatpak packages
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo $SS
flatpak install com.spotify.Client app.zen_browser.zen com.valvesoftware.Steam com.vscodium.codium $SS
echo "done [✓]"

echo "building neovim from source..."
#install neovim
git clone https://github.com/neovim/neovim $SS
cd neovim 
make CMAKE_BUILD_TYPE=RelWithDebInfo $SS
sudo make install $SS
echo "done [✓]"

echo "installing icon package..."
#icon pack
wget -qO- https://git.io/papirus-icon-theme-install | sh 
echo "done [✓]"

echo "installing spicetify.."
#install spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh  
export PATH=$PATH:/home/$USER/.spicetify $SS
source .bashrc $SS
spicetify backup $SS
spicetify config spotify_path "/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify" $SS
spicetify config prefs_path /home/username/.var/app/com.spotify.Client/config/spotify/prefs $SS
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify $SS
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps $SS
spicetify update $SS
echo "done [✓]"

echo "adding zen browser plugin... please following along"
#zen browser mods
curl -sO https://github.com/CosmoCreeper/Sine/releases/download/v2.2.3/sine-flatpak.sh $SS
chmod +x sine-flatpak.sh 
sudo ./sine-flatpak.sh 
echo "done [✓]"

echo "installing starship..."
#install starship
curl -sS https://starship.rs/install.sh | sh
echo "done [✓]"

echo "modding zen browser... please following along"
#zen browser mods
curl -sO https://github.com/CosmoCreeper/Sine/releases/download/v2.2.3/sine-flatpak.sh 
chmod +x sine-flatpak.sh $SS
sudo ./sine-flatpak.sh $SS
echo "done [✓]"

echo "installing jetbrains mono font..."
#install font jetbrains mono
mkdir ~/install 
mkdir ~/.fonts 
cd ~/install 
curl -sO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip $SS
unzip JetBrainsMono.zip~/.fonts $SS
echo "done [✓]"

echo "changing shell to zsh..."
#change shell
chsh -s $(which zsh) $SS
echo "done [✓]"

echo "staring dank shell materials intaller..."
#install dms
curl -fsSL https://install.danklinux.com | sh
echo "done [✓]"

echo "cleaning up..."
stow dotfiles $SS
cd ~/.dotfiles
stow .
cd -

#remove install folder
rm -rf ~/install $SS
echo "cleaned!"

echo "setting up backup..."
#setup timeshift and take backup
sudo timeshift 

echo "done [✓]"
sleep 2
echo "once rebooted run post-install.sh..."
sleep 2
echo "restaring system in 10 sec..."
sleep 9
echo "see you soon!"
sleep 1
sudo reboot