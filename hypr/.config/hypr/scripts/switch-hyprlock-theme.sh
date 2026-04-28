#!/bin/bash

menu=$(printf "Default\nLy" | fuzzel --dmenu --lines=2 --width=40)

case "$menu" in
    Default) echo "source = ~/.config/hypr/conf/hyprlock/default.conf" > ~/.config/hypr/hyprlock.conf ;;
    Ly) echo "source = ~/.config/hypr/conf/hyprlock/ly-style.conf" > ~/.config/hypr/hyprlock.conf ;;
esac
