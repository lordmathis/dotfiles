#!/bin/sh

sink=0

show_active() {
    if pacmd list-sinks | grep active | head -n 1 | grep -q speaker; then
        echo "speaker"
    elif pacmd list-sinks | grep active | head -n 1 | grep headphones; then
        echo "headphones"
    else
        echo "hdmi"
    fi
}

volume_up() {
    pactl set-sink-volume $sink +1%
}

volume_down() {
    pactl set-sink-volume $sink -1%
}

volume_mute() {
    pactl set-sink-mute $sink toggle
}

volume_print() {
    if pacmd list-sinks | grep active | head -n 1 | grep -q speaker; then
        icon=""
    elif pacmd list-sinks | grep active | head -n 1 | grep headphones; then
        icon=""
    else
        icon=""
    fi

    muted=$(pamixer --sink $sink --get-mute)

    if [ "$muted" = true ]; then
        echo "$icon --"
    else
        echo "$icon $(pamixer --sink $sink --get-volume)"
    fi
}


listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    --show)
        show_active
        ;;
    *)
        listen
        ;;
esac