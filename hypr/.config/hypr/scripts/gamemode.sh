!/usr/bin/env sh
HYPRGAMEMODE=$(cat ~/.config/hypr/vars/gamemode)
CURRENT_THEME=$(cat ~/.config/hypr/vars/theme)
CURRENT_ANIMATIONS=$(cat ~/.config/hypr/vars/animations)
if [ "$HYPRGAMEMODE" == "off" ] ; then
    pkill waybar &
    pkill hypridle &
    echo "source = ~/.config/hypr/conf/look_feel/minimal.conf" > ~/.config/hypr/conf/look_feel.conf
    echo "source = ~/.config/hypr/conf/animations/none.conf" > ~/.config/hypr/conf/animations.conf
    echo "on" > ~/.config/hypr/vars/gamemode
    notify-send -e "Gamemode Activated"
    exit
fi
    hypridle &
    waybar &
    waybar -c ~/.config/waybar/osd.jsonc -s ~/.config/waybar/osd.css &
    echo "off" > ~/.config/hypr/vars/gamemode
    echo "source = ~/.config/hypr/conf/look_feel/$CURRENT_THEME.conf" > ~/.config/hypr/conf/look_feel.conf
    echo "source = ~/.config/hypr/conf/animations/$CURRENT_ANIMATIONS.conf" > ~/.config/hypr/conf/animations.conf
    notify-send -e "Gamemode Deactivated"
    hyprctl reload
exit
