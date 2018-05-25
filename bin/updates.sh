#!/bin/sh

updates_arch=$(checkupdates | wc -l)
updates_aur=$(pacaur -k | wc -l)

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo ""
fi
