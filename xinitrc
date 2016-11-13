if [ -f ~/.Xresources ] ; then xrdb -load ~/.Xresources; fi
if [ -f ~/.Xresources.local ] ; then xrdb -override ~/.Xresources.local; fi

xautolock -time 1 -locker "i3lock --color=222222 --dpms"
if [ -f ~/.fehbg ] ; then ~/.fehbg; fi
dunst
exec i3
