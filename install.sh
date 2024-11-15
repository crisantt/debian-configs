#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

## UPDATE ##
sudo apt update
sudo apt upgrade -y

## Create Directories & Files ##
cd $builddir
mkdir -p /home/$username/github/suckless
mkdir -p /home/$username/softwares
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/.themes
mkdir -p /home/$username/.icons
mkdir -p /home/$username/Pictures/Wallpapers
chown -R $username:$username /home/$username

## Display Server Setup ##
bash /home/$username/github/debian-configs/scripts/dp_server.sh

## GPU Drivers Installation ##
bash /home/$username/github/debian-configs/scripts/drivers.sh

## essentials && developer packages ##
bash /home/$username/github/debian-configs/scripts/edp.sh

## fonts & appearance ("NO TOFU") ##
bash /home/$username/github/debian-configs/scripts/fonts-themes.sh

## Installs Browser ##
bash /home/$username/github/debian-configs/scripts/browser.sh

## Installs Neovim ##
bash /home/$username/github/debian-configs/scripts/text-editor.sh

### Setup Window Manager
bash /home/$username/github/debian-configs/scripts/window-managers.sh

## Docker ##
bash /home/$username/github/debian-configs/scripts/docker.sh

echo "THE SETUP IS DONE!!"
### Packages that I'm not sure of ###

## audio ##
# sudo apt install pipewire pipewire-audio-client-libraries wireplumber

# others that could be useful
# acpi upower htop neofetch brightnessctl

### bluetooth ###
# sudo apt install bluez blueman
## commands
## sudo systemctl enable bluetooth
## sudo systemctl start bluetooth

