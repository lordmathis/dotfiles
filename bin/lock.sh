#!/bin/bash

letterEnteredColor=00af46ff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff

qdbus org.keepassxc.KeePassXC.MainWindow /keepassxc org.keepassxc.MainWindow.lockAllDatabases 

i3lock \
	-t -i "$1" \
	--timepos="110:h-70" \
	--datepos="135:h-45" \
	--clock --datestr "Type password to unlock..." \
	--insidecolor=$background --ringcolor=$foreground --line-uses-inside \
	--keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
	--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
	--ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
	--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
	--verifcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
    --noinputtext="" --force-clock $lockargs
