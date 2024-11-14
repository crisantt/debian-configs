#!/bin/bash
username=$(id -u -n 1000)
### Setup Window Manager ###
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
    cd /home/$username/github/suckless
    git clone https://git.suckless.org/dmenu
    cd dmenu
    make clean install
    cd /home/$username/
    echo "picom -fb &" >> /home/$username/.xinitrc
    echo "dunst &" >> /home/$username/.xinitrc
    echo "exec dwm" >> /home/$username/.xinitrc
    break
  elif [ "$wm" = "bspwm" ]; then
    # BSPWM
    apt install bspwm sxhkd polybar
    mkdir -p /home/$username/.config/bspwm /home/$username/.config/sxhkd
    cp /usr/share/doc/bspwm/examples/bspwmrc /home/$username/.config/bspwm/
    cp /usr/share/doc/bspwm/examples/sxhkdrc /home/$username/.config/sxhkd/
    chmod +x ~/.config/bspwm/bspwmrc
    echo "picom -fb &" >> /home/$username/.xinitrc
    echo "dunst &" >> /home/$username/.xinitrc
    echo "exec bspwm" >> /home/$username/.xinitrc
    break
  fi
done
