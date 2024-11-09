## packages essentials ##
sudo apt update && sudo apt upgrade -y
sudo apt install -y bspwm sxhkd feh picom alacritty rofi xclip dunst polybar thunar pavucontrol

## XORG ##
sudo apt install -y xserver-xorg-core xserver-xorg-input-libinput xserver-xorg-video-intel x11-xserver-utils xinit
## sudo apt install xserver-xorg-video-amdgpu xserver-xorg-video-nouveau

## developer packages ##
sudo apt install -y build-essential pkg-config cmake zlib1g-dev libssl-dev libffi-dev libxcb1-dev libx11-dev libx11-xcb-dev libxrandr-dev libxinerama-dev libxft-dev autoconf automake libtool openjdk-17-jdk clangd wget curl zip

## fonts & appearance ##
sudo apt install -y lxappearance fonts-dejavu fonts-font-awesome fonts-noto-core fonts-noto-cjk fonts-noto-color-emoji fonts-hack-ttf

## audio ##
# sudo apt install pipewire pipewire-audio-client-libraries wireplumber

# others that could be useful
# acpi upower htop neofetch brightnessctl

### bluetooth ###
# sudo apt install bluez blueman
## commands
## sudo systemctl enable bluetooth
## sudo systemctl start bluetooth

