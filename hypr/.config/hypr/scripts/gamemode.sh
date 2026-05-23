#!/usr/bin/env sh

HYPRGAMEMODE=$(cat ~/.config/hypr/vars/gamemode)
CURRENT_THEME=$(cat ~/.config/hypr/vars/theme)
CURRENT_ANIMATIONS=$(cat ~/.config/hypr/vars/animations)
if [ "$HYPRGAMEMODE" == "off" ] ; then
    pkill waybar &
    pkill hypridle &
    echo 'require("look_feel.none")' > ~/.config/hypr/conf/look_feel.lua
    echo 'require("animations.none")' > ~/.config/hypr/conf/animations.lua
    echo "on" > ~/.config/hypr/vars/gamemode
    notify-send -e "Gamemode Activated"
    exit
fi
    hypridle &
    waybar &
    waybar -c ~/.config/waybar/osd.jsonc -s ~/.config/waybar/osd.css &
    echo "off" > ~/.config/hypr/vars/gamemode
    echo 'require("look_feel.$CURRENT_THEME")' > ~/.config/hypr/conf/look_feel.lua
    echo 'require("animations.$CURRENT_ANIMATIONS")' > ~/.config/hypr/conf/animations.lua
    notify-send -e "Gamemode Deactivated"
    hyprctl reload
exit
