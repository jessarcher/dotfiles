if [ -f ~/.Xresources ] ; then xrdb -load ~/.Xresources; fi
if [ -f ~/.Xresources.local ] ; then xrdb -override ~/.Xresources.local; fi
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec dbus-launch i3
