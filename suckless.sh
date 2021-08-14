#!/bin/sh

# Installing dependencies
sudo pacman -S libx11 libxft libxinerama base-devel

# Cloning suckless builds
git clone https://github.com/matias685/suckless ~/src/

# Installing suckless builds
cd ~/src/suckless/dwm && make && sudo make install 
cd ~/src/suckless/st && make && sudo make install
cd ~/src/suckless/dmenu && make && sudo make install
cd ~/src/suckless/slstatus && make && sudo make install

