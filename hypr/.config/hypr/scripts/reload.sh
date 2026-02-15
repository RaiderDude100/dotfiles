#!/bin/bash

hyprctl reload # Reload hyprland configuration

pkill waybar # Kill waybar
pkill swaync # Kill swaync

waybar & # Start waybar
waybar -c ~/.config/waybar/osd.jsonc -s ~/.config/waybar/osd.css & # Start osd
swaync & # Start swaync
