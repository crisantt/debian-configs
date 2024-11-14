# Debian Config

### Only use this to a fresh MINIMAL installed Debian (Thanks)
```
mkdir -p ~/github && cd ~/github
git clone https://github.com/crscrused/debian-configs.git
cd debian-configs
sudo bash install.sh
```
## Autostart of .xinitrc when you log in
#### Paste it in your ~/.bashrc
```
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
```
