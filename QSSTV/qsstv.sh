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

# W A R N I N G !
echo "+-------------+"
echo "| BASIC SETUP |"
echo "+-------------+"
echo
echo "[+] pavucontrol settings : go to the "Output Devices" tab to verify that you have the "Null Output" device"
echo "[+] qsstv settings       : go to "Options" -> "Configuration" -> "Sound" and select the "PulseAudio" Audio Interface"
echo 

echo "+------------------------------------------+"
echo "| I N I T I A L I Z I N G    D E C O D E R |"
echo "+------------------------------------------+"
echo

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
