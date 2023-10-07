#!/usr/bin/env sh

sudo dnf -y update

sudo dnf -y install fedora-workstation-repositories

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y install dnf-utils git

sudo dnf -y install gstreamer1-{libav,plugins-{good,ugly,bad{-free,-nonfree}}} --setopt=strict=0

sudo dnf -y install unrar p7zip p7zip-plugins

sudo dnf -y install java

sudo dnf -y --allowerasing install transmageddon handbrake-gui avidemux kdenlive openshot lives vlc mpv gnome-mpv soundconverter audacity-freeworld muse lmms amarok flowblade

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install ./google-chrome-stable_current_x86_64.rpm

sudo dnf -y install brave

sudo dnf -y install libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-langpack-es

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y check-update
sudo dnf -y install code