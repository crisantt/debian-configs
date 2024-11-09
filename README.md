# Guide for me
## Bspwm Window Manager
### Can't Remember them
<pre>
mkdir -p ~/.config/bspwm ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc
touch ~/.xinitrc
echo "picom -fb &"  >> ~/.xinitrc
echo "dunst &"  >> ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc
</pre>
