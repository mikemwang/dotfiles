urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources
/usr/lib/kdeconnectd &
exec i3
