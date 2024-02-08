#!/bin/bash

# Función para ejecutar un bloque de script y mostrar un mensaje de error si falla
function ejecutar_bloque() {
  local script="$1"
  local mensaje="$2"

  sh ~/.dotfiles/scripts/login.sh
  echo "$mensaje"
  if sh "$script"; then
    echo "Ejecución exitosa"
  else
    echo "**ERROR:** Falló la ejecución de '$script'"
    ./logo.sh
    exit 1
  fi
}

# Inicio del script

# Fedora Setup
ejecutar_bloque ~/.dotfiles/scripts/fedora-setup.sh "Ejecutando instalación base de Fedora"

# Cargo
ejecutar_bloque ~/.dotfiles/scripts/install-cargo-app.sh "Ejecutando instalación de dependencias con cargo"

# Github desktop
ejecutar_bloque ~/.dotfiles/scripts/install-github-desktop.sh "Ejecutando instalación de Github desktop"

# Tmux y complementos
ejecutar_bloque ~/.dotfiles/scripts/install-tmux.sh "Ejecutando instalación de Tmux y complementos para Tmux"

# Wallpapers
ejecutar_bloque ~/.dotfiles/scripts/install-wallpaper.sh "Ejecutando descargas de wallpapers"

# Fonts
ejecutar_bloque ~/.dotfiles/scripts/install-fonts.sh "Ejecutando instalación de las fuentes de letras necesarias"

# Post-install fedora
ejecutar_bloque ~/.dotfiles/scripts/post-install-fedora.sh "Ejecutando instalación de la post-instalación para fedora"

# Enlaces simbólicos
ejecutar_bloque ~/.dotfiles/scripts/enlaces-simbolicos.sh "Ejecutando la creación de los enlaces simbólicos finales"


# Fin del script

sh ~/.dotfiles/scripts/login.sh
echo "Ha finalizado la instalación de la configuración sistema operativo..."
echo "reinicia y disfruta"

# Pregunta de reinicio
echo "¿Desea reiniciar el equipo ahora? (S/n)"
read ejecutar

if [[ $ejecutar =~ ^[Ss]$ ]]; then
  echo "Reiniciando el equipo..."
  echo "sudo reboot"
else
  echo "Saliendo del script..."
  exit 0
fi


