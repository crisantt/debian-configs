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
mkdir -p /home/$username/github
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/.themes
mkdir -p /home/$username/.icons
mkdir -p /home/$username/Pictures/Wallpapers
touch /home/$username/.xinitrc

## Display Server Setup ##
echo "Please Select Your Display Server"
dpserver_option=("xorg" "wayland")
select dpserver in "${dpserver_option[@]}"; do
  if [ "$dpserver" = "xorg" ]; then
    ## XORG ##
    apt install xserver-xorg-core xserver-xorg-input-libinput x11-xserver-utils xinit -y
    break
  elif [ "$dpserver" = "wayland" ]; then
    ## Wayland ##
    apt install wayland-protocols xwayland -y
    break
  fi
done

## GPU Drivers Installation ##
echo "Please Select Your GPU Driver"
gpu_option=("intel" "amd" "nvidia-open" "nvidia-proprietary")
select gpu in "${gpu_option[@]}"; do
  if [ "$gpu" = "intel" ]; then
    apt install xserver-xorg-video-intel -y
    break
  elif [ "$gpu" = "amd" ]; then
    apt install xserver-xorg-video-amdgpu -y
    break
  elif [ "$gpu" = "nvidia-open" ]; then
    apt install xserver-xorg-video-nouveau -y
    break
  elif [ "$gpu" = "nvidia-proprietary" ]; then
    apt install nvidia-cuda-dev nvidia-cuda-toolkit -y
    break
  fi
done

clear

## packages essentials ##
apt install feh picom rofi xclip dunst thunar firefox-esr pavucontrol -y

## developer packages ##
apt install build-essential libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxtst-dev libpango1.0-dev libxpm-dev -y
apt install make gcc libtool wget curl unzip -y
apt install clangd openjdk-17-jdk -y

## fonts & appearance ("NO TOFU") ##
sudo apt install lxappearance fonts-dejavu fonts-font-awesome fonts-noto-core fonts-noto-cjk fonts-noto-color-emoji fonts-hack-ttf -y

### Setup Window Manager
wm_option=("dwm" "bspwm")
select wm in "${wm_option[@]}"; do
  if [ "$wm" = "dwm" ]; then
    # DWM
    apt install suckless-tools
    cd /home/$username/github
    git clone https://git.suckless.org/dwm
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
    echo "exec dwm" >> /home/$username/.xinitrc
    break
  fi
done

echo "SETUP DONE"

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

