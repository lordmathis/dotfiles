#!/bin/bash

intern=eDP-1
extern=HDMI-1

case $1 in
    "single")      
        if xrandr | grep "$extern disconnected"; then
            xrandr --output "$extern" --off --output "$intern" --auto
        else
            xrandr --output "$intern" --off --output "$extern" --auto
        fi
        ;;
    "dual")
        if xrandr | grep "$extern disconnected"; then
            xrandr --output "$extern" --off --output "$intern" --auto
        else
            xrandr --output $extern --primary 
            xrandr --output $extern --left-of $intern
        fi
        ;;
esac

i3-msg restart
