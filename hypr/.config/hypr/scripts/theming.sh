#!/bin/bash

menu=$(printf "Switch Theme\nSwitch Waybar Theme\nSwitch Hyprlock Theme\nSwitch Launcher" | fuzzel --dmenu --lines=4 --width=40)

case "$menu" in
    'Switch Theme') ~/.config/hypr/scripts/switch-theme.sh ;;
    'Switch Waybar Theme') ~/.config/hypr/scripts/switch-waybar-theme.sh ;;
    'Switch Hyprlock Theme') ~/.config/hypr/scripts/switch-hyprlock-theme.sh ;;
    'Switch Launcher') ~/.config/hypr/scripts/switch-launcher.sh ;;
esac
