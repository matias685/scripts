#!/bin/sh

#Setup keyboard
echo 'options hid_apple fnmode=2' | sudo tee /etc/modprobe.d/hid_apple.conf
echo 'options hid_apple swap_opt_cmd=1' | sudo tee /etc/modprobe.d/hid_apple.conf

#Setup Firewalld
sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

#Speed up DNF
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

#Update packages
sudo dnf upgrade -y

#Setup RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

#Remove unneeded packages
sudo dnf -y remove abrt nm-connection-editor mozilla-filesystem quota* nmap-ncat virtualbox-guest-additions spice-vdagent nfs-utils teamd tcpdump sgpio ImageMagick* adcli libreoffice* lvm2 qemu-guest-agent hyperv* gnome-classic* baobab *kkc* *zhuyin* *pinyin* *evince* *yelp* ModemManager fedora-bookmarks fedora-chromium-config gnome-themes-extra gnome-shell-extension-background-logo gnome-remote-desktop NetworkManager-pptp-gnome NetworkManager-ssh-gnome NetworkManager-openconnect-gnome NetworkManager-openvpn-gnome NetworkManager-vpnc-gnome podman*  *libvirt* open-vm* *speech* sos totem gnome-characters openssh-server xorg-x11-drv-vmware yajl words ibus-hangul realmd rsync net-snmp-libs net-tools traceroute mtr geolite2* gnome-boxes gedit gnome-calendar cheese gnome-contacts rythmbox gnome-maps gnome-weather gnome-logs ibus-typing-booster *m17n* gnome-color-manager mlocate cyrus-sasl sssd* gnome-user* dos2unix rng-tools ppp* ntfs* xfs*  thermald *perl* gnome-shell-extension-apps-menu gnome-shell-extension-horizontal-workspaces gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu gnome-shell-extension-window-list bluez* *cups* sane* simple-scan *hangul* NetworkManager-config-connectivity-fedora 

#Disable openh264 repo
sudo dnf config-manager --set-disabled fedora-cisco-openh264 -y

#Install packages that I use
sudo dnf -y install neofetch git-core vim-minimal gnome-tweaks gnome-extensions-app fedora-workstation-repositories zsh util-linux-user

#Setting up Flatpak
flatpak remote-add --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --user gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
flatpak remove --unused

# Install flatpaks
flatpak install flathub com.github.tchx84.Flatseal org.chromium.Chromium org.telegram.desktop org.videolan.VLC org.gnome.TextEditor org.gnome.Lollypop com.spotify.Client org.qbittorrent.qBittorrent com.discordapp.Discord org.gnome.Epiphany org.gnome.Geary org.gnome.gitlab.YaLTeR.VideoTrimmer fr.romainvigier.MetadataCleaner com.bitwarden.desktop -y

output "All done! You have to reboot now."
