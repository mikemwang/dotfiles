# switch to termite
## start urxvt daemon, this is makes it fast and low-memory for multiple instances of urxvt
#urxvtd -o -q -f

## colors for urxvt
#xrdb -merge ~/.config/X11/.Xresources


# start udiskie, to auto mount connected usb devices
# this might already be handled by spacefm. leave it out for now
# udiskie &

# set better key repeat rate
xset r rate 200 25

# start the kdeconnect daemon. for some reason the autostart entry it creates on install
# does not seem to work
/usr/lib/kdeconnectd &

# remap caps lock
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&

# start i3, make this last as it will hang
exec i3
