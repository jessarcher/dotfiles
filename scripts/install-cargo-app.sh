#!/usr/bin/env sh

echo "Instalando zoxide"
cargo install zoxide --locked

# echo "Instalando bat"
# cargo install --locked bat

echo "Instalando exa"
cargo install exa

# echo "Instalando ripgrep"
# cargo install ripgrep


echo "Instalando Lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

sudo rm lazygit.tar.gz
sudo rm -rf lazygit
