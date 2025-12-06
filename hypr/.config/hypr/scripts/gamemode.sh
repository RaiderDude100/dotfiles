!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    pkill waybar &
    pkill hypridle &
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 2;\
        keyword general:col.active_border rgba(ffffffff);\
        keyword general:col.inactive_border rgba(00000000);\
        keyword decoration:rounding 0"
    exit
    notify-send -e "Gamemode Activated"
fi
    hypridle &
    waybar &
    notify-send -e "Gamemode Deactivated"
    hyprctl reload
exit
