#!/usr/bin/env sh

# configurar node por defecto
nvm install node

# Configurando zsh por defecto
chsh -s $(which zsh)

sudo dnf -y update

sudo dnf -y install fedora-workstation-repositories

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y install dnf-utils git

sudo dnf -y install gstreamer1-{libav,plugins-{good,ugly,bad{-free,-nonfree}}} --setopt=strict=0

sudo dnf -y install unrar p7zip p7zip-plugins

sudo dnf -y install java

sudo dnf -y --allowerasing install handbrake-gui avidemux kdenlive openshot lives vlc mpv gnome-mpv soundconverter audacity-freeworld muse lmms amarok flowblade

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install ./google-chrome-stable_current_x86_64.rpm
sudo rm ./google-chrome-stable_current_x86_64.rpm

sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf -y install brave-browser

sudo dnf -y --allowerasing install xine-lib xine-lib-extras xine-lib-extras-freeworld libdvdread libdvdnav lsdvd libdvbpsi ffmpeg ffmpeg-libs libmatroska xvidcore gstreamer-ffmpeg gstreamer-plugins-ugly

sudo dnf -y install gimp inkscape 

sudo dnf -y install libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-langpack-es

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y check-update
sudo dnf -y install code

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

