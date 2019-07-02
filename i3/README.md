# i3

## Installation

```bash
pacman -S i3-wm i3status rofi i3lock xbacklight feh conky touchpad_config
```

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