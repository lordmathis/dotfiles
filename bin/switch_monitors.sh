#!/bin/bash
intern=eDP-1
extern=HDMI-1

if xrandr --listactivemonitors | grep "$intern"; then
    xrandr --output "$intern" --off
else
    xrandr --output "$intern" --auto 
fi
