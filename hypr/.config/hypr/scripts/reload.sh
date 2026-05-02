#!/bin/bash
pkill -USR1 kitty # Reload Kitty
hyprctl reload # Reload Hyprland
makoctl reload # Reload Mako

killall waybar # Kill waybar
# pkill swaync # Kill swaync

waybar & # Start waybar
waybar -c ~/.config/waybar/osd.jsonc -s ~/.config/waybar/osd.css & # Start osd
# swaync & # Start swaync
