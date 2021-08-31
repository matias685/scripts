#!/bin/sh
# clone the repository
git clone https://github.com/vivien/i3blocks
cd i3blocks
# compile and install it
./autogen.sh
./configure
make
make install