#!/bin/sh
git clone git://git.sv.gnu.org/emacs.git
sudo pacman -S base-devel cmake libgccjit
#sudo dnf install autoconf texinfo gtk3-devel libgccjit-devel gnutls-devel ncurses-devel cmake
#sudo apt install build-essential libgtk-3-dev libgnutls28-dev libtiff5-dev libgif-dev libjpeg-dev libpng-dev libxpm-dev libncurses-dev texinfo cmake
./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/share/man --without-gconf --without-gpm --with-native-compilation --with-pgtk --with-xml2 'CFLAGS=-march=x86-64 -O2 -pipe'
make -j6
sudo make install
