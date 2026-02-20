#!/usr/bin/env bash

GAMEMODE_STATUS=$(cat ~/.config/hypr/vars/gamemode)

if [ "$GAMEMODE_STATUS" == "on" ]; then
    notify-send -e "Please Exit Gamemode"
    exit
else
    if pgrep -f "^waybar$" >/dev/null; then
        pkill -USR1 -f "^waybar$"
    else
        waybar &
    fi
fi
