# Debian Config

#### Only use this to a freshly installed Debian with no Desktop Environment(Thanks)
```
mkdir -p ~/github && cd ~/github
git clone https://github.com/crisantt/debian-configs.git
cd debian-configs
bash install.sh
```
### Autostart of .xinitrc when you log in
- Paste it in your ~/.bashrc
```
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
```
#### Feh Command
- Use this to generate .fehbg
- Add .fehbg to .xinitrc as ~/.fehbg &
```
cp -R ~/github/debian-configs/dotwallpapers/* ~/Pictures/Wallpapers
feh --bg-fill $(find ~/Pictures/Wallpapers -type f | shuf -n 1)
```
