#!/bin/sh
git clone git://git.sv.gnu.org/emacs.git
#sudo apt install build-essential libgtk-3-dev libgnutls28-dev libtiff5-dev libgif-dev libjpeg-dev libpng-dev libxpm-dev libncurses-dev texinfo
./autogen.sh
./configure --with-native-compilation --with-pgtk --with-xml2
make -j6
sudo make install
