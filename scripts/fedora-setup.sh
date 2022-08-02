#!/usr/bin/env sh

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
    anacron \
    cargo \
    gnome-tweaks \
    gnome-extensions-app \
    neovim \
    python3-neovim \
    git \
    kitty \
    zsh \
    g++ \
    lua-devel \
    luarocks \
    php \
    php-bcmath \
    php-mysqlnd \
    php-pecl-zip \
    php-pgsql \
    php-posix \
    php-soap \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    bat \
    fzf \
    httpie \
    ripgrep \
    tmux \
    ruby \
    python3 \
    htop \
    proselint \
    lm_sensors \
    discord \
    slack

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.telegram.desktop

sudo gem install lolcat

pip install gitlint

sudo luarocks install luacheck

cargo install stylua

# Composer
./install-composer.sh
composer global require laravel/installer

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node

# Docker setup
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker

echo "Don't forget to copy over your .ssh and .gnupg directories!"
