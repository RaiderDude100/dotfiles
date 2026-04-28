#!/bin/bash

menu=$(printf "Animation Switcher\nTheming\nConfigure System Powerplan\nGTK Settings\nQt5 Settings\nQt6 Settings" | fuzzel --dmenu --lines=6 --width=40)

case "$menu" in
    'Animation Switcher') ~/.config/hypr/scripts/animation-switch.sh ;;
    Theming) ~/.config/hypr/scripts/theming.sh ;;
    'Configure System Powerplan') ~/.config/hypr/scripts/switch-powerplan.sh ;;
    'GTK Settings') nwg-look ;;
    'Qt5 Settings') qt5ct ;;
    'Qt6 Settings') qt6ct ;;
esac


