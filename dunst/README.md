# Dunst

## Installing

```bash
pacman -S dunst libnotify
```

## Setting up dunst

```bash
mkdir ~/.config/dunst && cp /usr/share/dunst/dunstrc ~/.config/dunst/dunstrc

dunst &

notify-send "helloworld"
```

**protip**: adding dunst to i3 config enables a notification service which is required by nm-applet.