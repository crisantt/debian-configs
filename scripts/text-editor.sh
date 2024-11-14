#!/bin/bash

cd ~/github
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout tags/stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
