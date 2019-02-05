#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar

intern=eDP-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
    m=$intern
else
    m=$extern
fi

MONITOR=$m polybar default &
