#!/usr/bin/env sh

sudo dnf -y install fontconfig
cd ~
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
# wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
mkdir -p .local/share/fonts
unzip Meslo.zip -d .local/share/fonts
# unzip JetBrainsMono-2.304.zip -d .local/share/fonts
unzip JetBrainsMono.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd ~
rm Meslo.zip
# rm JetBrainsMono-2.304.zip
rm JetBrainsMono.zip
fc-cache -fv