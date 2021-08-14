#!/bin/sh

# Installing dependencies
sudo apt-get install libx11-dev libxft-dev libxinerama-dev

# Cloning suckless builds
git clone https://github.com/matias685/suckless ~/src/

# Installing suckless builds
cd ~/src/suckless/dwm && make && sudo make install 
cd ~/src/suckless/st && make && sudo make install
cd ~/src/suckless/dmenu && make && sudo make install
cd ~/src/suckless/slstatus && make && sudo make install

