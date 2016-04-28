[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources
[[ -f ~/.Xresources_local ]] && xrdb -override -I$HOME ~/.Xresources_local
