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

### Audio
Install `pulseaudio` and `pavucontrol` to set things up, just alsa by itself 
doesn't seem to be sufficient
