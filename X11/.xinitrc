# switch to termite
## start urxvt daemon, this is makes it fast and low-memory for multiple instances of urxvt
#urxvtd -o -q -f

## colors for urxvt
#xrdb -merge ~/.config/X11/.Xresources

# start the kdeconnect daemon. for some reason the autostart entry it creates on install
# does not seem to work
/usr/lib/kdeconnectd &

# start udiskie, to auto mount connected usb devices
# udiskie &

# start i3, make this last as it will hang
exec i3
