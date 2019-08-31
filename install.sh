#!/bin/bash

echo "Please ensure you have [wine] and [winetricks] installed before beginning."
echo "Hit Ctrl + C to cancel this if Wine is not already installed."
sleep 1
echo "Hit Enter to install"
read

echo "[LOG] --- Setting environment variables"
export WINEPREFIX="$HOME/.wine_pro"
export WINEARCH=win32

echo ''

echo "[LOG] --- Installing dotnet to local dir"
echo "[HELP] --- PLEASE FOLLOW THE INSTRUCTIONS IN THE INSTALL WIZARD. IT MAY TAKE A FEW MINUTES TO APPEAR"
winetricks dotnet45

echo ''

echo "[LOG] --- Opening PRO Client download"
echo "[HELP] --- PLEASE DOWNLOAD ZIP FILE TO THIS FOLDER AND PRESS ENTER"
echo "${0%/*}"
cd "${0%/*}"
browse "http://tiny.cc/PRO86" &
read

echo "[LOG] --- Extracting PRO client"
unzip ./PROClient_86.zip
ln -s "$(pwd)/init_pro" /usr/local/bin/init_pro

echo ''

echo "[LOG] --- Game Installed!"
echo "[HELP] --- Run 'init_pro' (or '/usr/local/bin/init_pro') to begin the game!"
