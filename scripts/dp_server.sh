#!/bin/bash
## Display Server Setup ##
echo "Please Select Your Display Server/Compositor"
dpserver_option=("xorg" "wayland")
select dpserver in "${dpserver_option[@]}"; do
  if [ "$dpserver" = "xorg" ]; then
    ## XORG ##
    sudo apt install xserver-xorg-core xserver-xorg-input-libinput x11-xserver-utils xinit -y
    break
  elif [ "$dpserver" = "wayland" ]; then
    ## Wayland ##
    sudo apt install wayland-protocols wayland-utils wl-clipboard xdg-desktop-portal-wlr libwlroots-dev xwayland qtwayland5 policykit-1-gnome network-manager-gnome network-manager libtgtk-layer-shell-dev
    break
  fi
done
