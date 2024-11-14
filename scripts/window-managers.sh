#!/bin/bash

### Setup Window Manager ###
wm_option=("dwm" "bspwm")
select wm in "${wm_option[@]}"; do
  if [ "$wm" = "dwm" ]; then
    # DWM
    cd ~/github/suckless
    git clone https://git.suckless.org/dwm
    cd dwm
    make clean install
    cd ~/github/suckless
    git clone https://git.suckless.org/st
    cd st
    make clean install
    cd ~/github/suckless
    git clone https://git.suckless.org/dmenu
    cd dmenu
    make clean install
    cd ~/
    echo "picom -fb &" >> ~/.xinitrc
    echo "dunst &" >> ~/.xinitrc
    echo "exec dwm" >> ~/.xinitrc
    break
  elif [ "$wm" = "bspwm" ]; then
    # BSPWM
    apt install bspwm sxhkd polybar
    mkdir -p ~/.config/bspwm ~/.config/sxhkd
    cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
    cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
    chmod +x ~/.config/bspwm/bspwmrc
    echo "picom -fb &" >> ~/.xinitrc
    echo "dunst &" >> ~/.xinitrc
    echo "exec bspwm" >> ~/.xinitrc
    break
  fi
done
