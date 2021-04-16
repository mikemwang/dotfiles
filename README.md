# dotfiles

## Things not covered in dotfiles
### AMD Drivers and Screen Tearing
Check that the output of

`lspci -k | grep -EA3 'VGA|3D|Display'`

has amdgpu as the kernel driver and kernel module in use. 

Then, use `xrandr -q` to find the name of the interface in use.
Should be in a form similar to HDMI-A-0. 

Use `xrandr --output HDMI-A-0 --set "TearFree" on` to temporarily
try out tear-free mode. Make sure to replace HDMI-A-0 with the 
name of the interface from the last step. 

If you encounter an error like:

```
X Error of failed request:  BadName (named color or font does not exist)

  Major opcode of failed request:  140 (RANDR)

  Minor opcode of failed request:  11 (RRQueryOutputProperty)

  Serial number of failed request:  47

  Current serial number in output stream:  47
```

reboot and try again. The interface name should change from something like
HDMI-1 (no middle letter) to HDMI-A-0 (middle letter).

To make this permenant, create the following file:

/etc/X11/xorg.conf.d/20-amdgpu.conf
Section "Device"
     Identifier "AMD"
     Driver "amdgpu"
     Option "TearFree" "true"
EndSection

### Audio
Install `pulseaudio` and `pavucontrol` to set things up, just alsa by itself 
doesn't seem to be sufficient

### Fonts
pacman -Syu awesome-terminal-fonts

### xpointerbarrier
May not want cursor to be able to leave the current workspace, install
xpointerbarrier using the instructions here:

https://www.uninformativ.de/git/xpointerbarrier/file/README.html

works right out of the box. 


### grub2 resolution
at grub, press c to enter command line and enter "videoinfo". note list of
available resolutions.

edit /etc/default/grub at the line 
`GRUB_GFXMODE=auto`
and change to:
`GRUB_GFXMODE="1920x1080x32,1024x768x32,auto"`
where the first resolution is the desired one, the second is the fallback,
and auto means select one that works automatically. Note the quotation marks.
After this edit run:
`sudo grub-mkconfig -o /boot/grub/grub.cfg`
and reboot. should work.


### sound
pavucontrol takes a long time to start, not sure why. Try this to switch sound profiles:

pactl set-card-profile 2 output:analog-stereo

refer to this stackoverflow:
https://unix.stackexchange.com/questions/462670/set-default-profile-for-pulseaudio
