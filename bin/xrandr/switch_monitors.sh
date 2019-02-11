#!/bin/bash

intern=eDP-1
extern=HDMI-1

case $1 in
    "-i")
        m=$intern
        ;;
    "-e")
        m=$extern
        ;;
    *)
        echo "Wrong option"
esac
  
if xrandr --listactivemonitors | grep "$m"; then
    xrandr --output "$m" --off
else
    xrandr --output "$m" --auto 
fi