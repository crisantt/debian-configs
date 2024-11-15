#!/bin/bash
## Display Server Setup ##
echo "Please Select Your Display Server"
dpserver_option=("xorg" "wayland")
select dpserver in "${dpserver_option[@]}"; do
  if [ "$dpserver" = "xorg" ]; then
    ## XORG ##
    sudo apt install xserver-xorg-core xserver-xorg-input-libinput x11-xserver-utils xinit -y
    break
  elif [ "$dpserver" = "wayland" ]; then
    ## Wayland ##
    sudo apt install glslang-tools libcairo2-dev libcap-dev libdbus-1-dev libdisplay-info-dev libevdev-dev libgdk-pixbuf2.0-dev libinput-dev libjson-c-dev libliftoff-dev libpam0g-dev libpango1.0-dev libpcre2-dev libpixman-1-dev libseat-dev libsystemd-dev libvulkan-dev libwayland-dev libwayland-egl1 libwlroots-dev libxcb-ewmh-dev libxkbcommon-dev meson pkgconf scdoc tree wayland-protocols xwayland -y
    break
  fi
done
