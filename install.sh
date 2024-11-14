#!/bin/bash

# Check if Script is Run as Root
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

# Installs Thorium Browser
cd /home/$username/github
wget https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/thorium-browser_128.0.6613.189_SSE3.deb
apt install ./thorium-browser_128.0.6613.189_SSE3.deb -y

## fonts & appearance ("NO TOFU") ##
sudo apt install lxappearance fonts-dejavu fonts-font-awesome fonts-noto-core fonts-noto-cjk fonts-noto-color-emoji fonts-hack-ttf -y
cd /home/$username/.icons
wget https://github.com/catppuccin/cursors/releases/download/v1.0.1/catppuccin-mocha-lavender-cursors.zip -O cml.zip
wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/rose-pine-icons.tar.gz
unzip cml.zip
tar -zvxf rose-pine-icons.tar.gz
mv /home/$username/.icons/icons/* /home/$username/.icons/
mv /home/$username/.icons/cml/* /home/$username/.icons/
rm -rf icons cml
rm -rf cml.zip
cd /home/$username/.themes
wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/gtk3.tar.gz
tar -zvxf gtk3.tar.gz
mv /home/$username/.themes/gtk3/* /home/$username/.themes/
rm -rf gtk3.tar.gz
rm -rf gtk3
cd /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip
unzip FiraCode.zip
unzip Mononoki.zip
rm -rf Firacode.zip 
rm -rf Mononoki.zip
fc-cache -fv

# Installs Neovim
cd /home/$username/github
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout tags/stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

cd $builddir
### Setup Window Manager
wm_option=("dwm" "bspwm")
select wm in "${wm_option[@]}"; do
  if [ "$wm" = "dwm" ]; then
    # DWM
    cd /home/$username/github/suckless
    git clone https://git.suckless.org/dwm
    cd dwm
    make clean install
    cd /home/$username/github/suckless
    git clone https://git.suckless.org/st
    cd st
    make clean install
    cd /home/$username
    echo "~/Pictures/Wallpapers/.fehbg" >> /home/$username/.xinitrc
    echo "picom -fb &" >> /home/$username/.xinitrc
    echo "dunst &" >> /home/$username/.xinitrc
    echo "exec dwm" >> /home/$username/.xinitrc
    break
  elif [ "$wm" = "bspwm" ]; then
    # BSPWM
    apt install bspwm sxhkd polybar
    mkdir -p ~/.config/bspwm ~/.config/sxhkd
    cp /usr/share/doc/bspwm/examples/bspwmrc /home/$username/.config/bspwm/
    cp /usr/share/doc/bspwm/examples/sxhkdrc /home/$username/.config/sxhkd/
    chmod +x ~/.config/bspwm/bspwmrc
    echo "~/Pictures/Wallpapers/.fehbg" >> /home/$username/.xinitrc
    echo "picom -fb &" >> /home/$username/.xinitrc
    echo "dunst &" >> /home/$username/.xinitrc
    echo "exec bspwm" >> /home/$username/.xinitrc
    break
  fi
done

echo "SETUP DONE"
echo "REBOOT YOUR PC, NOW!! (if you want)"
echo "Use startx command (for xorg only)"

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

