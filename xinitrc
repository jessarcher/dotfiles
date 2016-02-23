[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xresources_local ]] && xrdb -override -I$HOME ~/.Xresources_local
