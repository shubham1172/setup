# i3

## Installation

```bash
pacman -S i3-wm i3status rofi i3lock xbacklight feh touchpad_config
```

### Extras
```bash
pacman -S xautolock xss-lock network-manager-applet gnome-keyring dunst libnotify compton playerctl
```

* xautolock - lock during inactivity
* xss-lock - lock when lid closes [[ref](https://wiki.archlinux.org/index.php/Power_management#xss-lock)]
* network-manager-applet - GUI for networks
* gnome-keyring - store passwords for nm-applet
* dunst and libnotify - notification daemon services
* compton - composite window manager (window effects)

Configuration files

* ~/.config/i3/config
* /etc/i3status.conf

## Connecting to a network

```bash
nmcli con up <SSID> --ask
```

## Enable tap to click

List out devices
```bash
touchpad_config -l
```

Enable tap to click and natural scrolling 
```bash
touchpad_config -e <dev-id>
```

Or add to i3 config

```bash
touchpad_config -e $(touchpad_config -l | grep Synaptic | awk '{print $5}' | sed -e "s/id=//")
```

## Auto locking

Put these in i3 config

```bash
# lock when inactive
exec --no-startup-id xautolock -time 5 -detectsleep -locker ${HOME}/setup/i3/auto_lock_screen.sh

# lock when the lid closes
exec --no-startup-id xss-lock -- "/path/to/lock.sh"
```

lock.sh
```bash
# use this to lock and use a lockscreen image
i3lock -i "/path/to/lock/screen.png"

# use this to lock with the background blurred
i3lock-fancy
```


## Setting up multiple displays

View all displays
```bash
xrandr
```

Extend to an extra monitor on the right
```bash
xrandr --output HDMI1 --auto --right-of eDP1
```

Clone to a projector
```bash
xrandr --output HDMI1 --mode 1024x768 --same-as eDP1
```

Assigning workspaces to displays
```bash
workspace 1 output LVDS1
workspace 2 output primary
workspace 5 output VGA1 LVDS1
workspace "2: vim" output VGA1
```

## Key mapping

i3 uses key names from xmodmap, a X server utility. To list out all keys
```bash
xmodmap -pke
```

General syntax
```bash
bindsym Key1+Key2 exec command
```