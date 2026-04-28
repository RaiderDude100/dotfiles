#!/bin/bash

menu=$(printf "Rofi\nFuzzel" | fuzzel --dmenu --lines=2 --width=40)

case "$menu" in
    Rofi) echo "rofi -show drun -show-icons -icon-theme 'Papirus'" > ~/.config/hypr/vars/launcher ;;
    Fuzzel) echo "fuzzel" > ~/.config/hypr/vars/launcher ;;
esac

