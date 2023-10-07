#!/usr/bin/env sh

# Configurar administrador de plugins para Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# Instalar Tmuxinator
gem install tmuxinator