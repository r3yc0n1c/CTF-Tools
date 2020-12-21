#!/bin/bash

#####################################################################
# Script Name	:	qsstv.sh
# Author        :   r3yc0n1c
# Description	:	Decode SSTV Audio signals from audio file
# Download		:	https://github.com/r3yc0n1c/CTFs/tree/master/Tools/QSSTV
# Installation	:	apt-get install qsstv
#					chmod +x qsstv.sh
# Usage			:	./qsstv.sh <auio-filename>
#					[Ctrl + c] to stop playback
#####################################################################

# check if command line arg is empty
if [ -z  $1 ]; then
	echo "Usage: qsstv.sh <auio-filename>"
	exit 0
else
	out=$(pactl load-module module-null-sink sink_name=virtual-cable)
	echo "[*] Running pavucontrol..."
	pavucontrol &
	echo "[*] Running qsstv..."
	qsstv &
	echo "[*] Playing audio..."
	paplay -d virtual-cable $1
	
	echo 
	echo "[*] Stopped..."
	echo "[*] Currently loaded modules..."
	pactl list short modules | grep null
	echo "[*] Unloading current module $out"
	pactl unload-module $out
	echo "[*] Cleanup Complete!"
fi
