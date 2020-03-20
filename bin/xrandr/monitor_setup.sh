#!/bin/bash

left=DP-1-2-2
middle=DP-1-2-3
right=eDP-1-1

xrandr --output "$middle" --auto --primary && xrandr --output "$left" --auto --left-of "$middle" && xrandr --output "$right" --auto --right-of "$middle"
