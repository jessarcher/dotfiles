#!/usr/bin/env sh

DOTFILES="$HOME/.dotfiles"

rm $HOME/.zshrc
ln -s $DOTFILES/zshrc $HOME/.zshrc

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.gitconfig
ln -s $DOTFILES/gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore_global
ln -s $DOTFILES/gitignore_global $HOME/.gitignore_global

rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

mkdir -p $HOME/.local/bin

rm -rf $HOME/.local/bin/deliver
ln -s $DOTFILES/scripts/deliver $HOME/.local/bin/deliver

mkdir -p $HOME/.nvm
ln -s $DOTFILES/nvm/default-packages $HOME/.nvm/default-packages

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
