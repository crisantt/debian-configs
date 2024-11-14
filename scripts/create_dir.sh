#!/bin/bash

## Create Directories & Files ##
cd $builddir
mkdir -p /home/$username/github/suckless
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/.themes
mkdir -p /home/$username/.icons
mkdir -p /home/$username/Pictures/Wallpapers
cp -R dotwallpapers/* /home/$username/Pictures/Wallpapers/
touch /home/$username/.xinitrc
chown -R $username:$username /home/$username
