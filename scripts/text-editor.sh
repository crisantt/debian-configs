#!/bin/bash
username=$(id -u -n 1000)
## Install Neovim ##
cd /home/$username/github
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout tags/stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
