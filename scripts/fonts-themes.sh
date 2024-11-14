#!/bin/bash

## fonts & appearance ("NO TOFU") ##
apt install lxappearance fonts-dejavu fonts-font-awesome fonts-noto-core fonts-noto-cjk fonts-noto-color-emoji fonts-hack-ttf -y
cd ~/.icons
wget https://github.com/catppuccin/cursors/releases/download/v1.0.1/catppuccin-mocha-lavender-cursors.zip -O cml.zip
wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/rose-pine-icons.tar.gz
unzip cml.zip
tar -zvxf rose-pine-icons.tar.gz
mv ~/.icons/icons/* ~/.icons/
mv ~/.icons/cml/* ~/.icons/
rm -rf icons cml
rm -rf cml.zip
cd ~/.themes
wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/gtk3.tar.gz
tar -zvxf gtk3.tar.gz
mv ~/.themes/gtk3/* ~/.themes/
rm -rf gtk3.tar.gz
rm -rf gtk3
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip
unzip FiraCode.zip
unzip Mononoki.zip
rm -rf Firacode.zip 
rm -rf Mononoki.zip
fc-cache -fv
cd ~/

## Starhip
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
