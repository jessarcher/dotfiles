#!/bin/bash

clear
printf "
█▀ █▀▀ █▄░█ ▀█▀ █░█ 
▄█ ██▄ █░▀█ ░█░ █▄█ 
             STUDIO
"

sudo dnf -y install git curl wget

echo "Configurar git"
git config --global user.name "Luis Guillermo Echenique"
git config --global user.email "elepistemedev@gmail.com"

echo "Generar una nueva clave SSH"
ssh-keygen -t ed25519 -C "elepistemedev@gmail.com"
ssh-add ~/.ssh/id_ed25519

clear
printf "
█▀ █▀▀ █▄░█ ▀█▀ █░█
▄█ ██▄ █░▀█ ░█░ █▄█
             STUDIO

"

cat ~/.ssh/id_ed25519.pub

echo ""
echo "sh install.sh"