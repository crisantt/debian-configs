#!/bin/bash

## Check if Script is Run as Root ##
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

## UPDATE ##
apt update
apt upgrade -y

## Create Directories & Files ##
bash /home/$username/github/debian-configs/scripts/create_dir.sh
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

