#!/bin/sh

# Extra Repos
sudo dnf copr enable oleastre/kitty-terminal
sudo dnf copr enable daftaupe/gopass
sudo dnf copr enable thindil/universal-ctags
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install packages
sudo dnf install \
    boost-devel \
    cmake \
    docker-ce \
    fd-find \
    fortune-mod \
    gcc-c++ \
    git \
    gopass \
    httpie \
    kitty \
    neovim \
    nodejs \
    php-cli \
    php-json \
    php-mbstring \
    php-xml \
    php-pdo \
    php-pgsql \
    php-process \
    pidgin \
    pidgin-libnotify \
    pidgin-otr \
    postgresql \
    python-devel \
    python2-neovim \
    python3-neovim \
    python3-devel \
    the_silver_searcher \
    thunderbird \
    tmux \
    universal-ctags \
    urlview \
    xclip \
    xsel \
    zsh

sudo gem install lolcat tmuxinator

# zsh Setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Docker setup
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Install Docker Compose
sudo curl -L $(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep "docker-compose-$(uname -s)-$(uname -m)\"" | grep browser_download_url | cut -d\" -f4) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Sack
git clone https://github.com/sampson-chen/sack.git /tmp/sack && cd /tmp/sack && chmod +x install_sack.sh && ./install_sack.sh

# GNUPG
# TODO: How to do this securely?

# Pass Setup
# TODO: Clone from personal repo
sudo ln -s /usr/bin/gopass /usr/local/bin/pass
curl -sSL $(curl -s https://api.github.com/repos/passff/passff-host/releases/latest | grep "install_host_app.sh" | grep browser_download_url | cut -d\" -f4) | bash -s -- firefox

# Dotfiles
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.zshrc
git clone git@github.com:jessarcher/dotfiles.git ~/.dotfiles
~/.dotfiles/install

# SSH Keys

# Composer
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")"

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php
sudo chmod +x /usr/local/bin/composer
