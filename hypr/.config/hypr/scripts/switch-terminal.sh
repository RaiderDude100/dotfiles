#!/bin/bash

menu=$(printf "Alacritty\nKitty" | fuzzel --dmenu --lines=2 --width=40)

case "$menu" in
    Alacritty) echo "alacritty" > ~/.config/hypr/vars/terminal ;;
    Kitty) echo "kitty" > ~/.config/hypr/vars/terminal ;;
esac

