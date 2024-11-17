#!/bin/bash
username=$(id -u -n 1000)
browser_option=("Thorium" "Floorp")
select browser in "${browser_option[@]}"; do
  if [ "$browser" = "Thorium"]; then
    ## Installs Thorium ##
    cd /home/$username/softwares
    wget https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/thorium-browser_128.0.6613.189_SSE3.deb
    sudo apt install ./thorium-browser_128.0.6613.189_SSE3.deb -y
  elif [ "$browser" = "Floorp"]; then
    ## Installs Floorp ##
    cd ~/softwares
    curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
    sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
    sudo apt update -y
    sudo apt install floorp -y
  fi
done
