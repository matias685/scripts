#!/bin/sh

# Installing dependencies
sudo xbps-install -S libx11-devel libxft-devel libxinerama-devel

# Cloning suckless builds
git clone https://github.com/matias685/suckless ~/src/

# Installing suckless builds
cd ~/src/dwm && make && sudo make install 
cd ~/src/st && make && sudo make install
cd ~/src/dmenu && make && sudo make install
cd ~/src/slstatus && make && sudo make install

