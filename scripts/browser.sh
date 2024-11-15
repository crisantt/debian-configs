#!/bin/bash
username=$(id -u -n 1000)
## Installs Thorium ##
cd /home/$username/softwares
wget https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/thorium-browser_128.0.6613.189_SSE3.deb
sudo apt install ./thorium-browser_128.0.6613.189_SSE3.deb -y
