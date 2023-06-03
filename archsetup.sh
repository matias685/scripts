#!/bin/sh
sudo pacman -S --needed fzf lf atool firefox lxappearance-gtk3 udiskie xorg-server pcmanfm-gtk3 dunst xorg-xset xorg-xrandr xwallpaper sxiv picom xorg-xinit redshift lxsession-gtk3 xsettingsd unclutter clipmenu bat xarchiver chromium gnome-themes-extra adwaita-qt5 adwaita-qt6 qt5ct qt6ct alsa-utils flameshot ufw zathura zathura-pdf-mupdf mpd ncmpcpp exa zsh dash man-db rsync reflector

# set dash as default sh
sudo ln -sf dash /bin/sh

# enable firewall
sudo ufw enable
sudo systemctl enable --now ufw.service
