#!/bin/sh

updates_arch=$(checkupdates | wc -l)

if [ "$updates_arch" -gt 0 ]; then
    echo " $updates_arch"
else
    echo ""
fi
