#!/bin/sh

mode="$(cat $HOME/.config/hypr/vars/mode)"
wallpaper="$(cat $HOME/.config/hypr/vars/wallpaper)"

if [ "$mode" == "light" ] ; then
    echo "dark" > $HOME/.config/hypr/vars/mode
    $HOME/.config/hypr/scripts/wallpaper.sh "$wallpaper"
    notify-send 'Switched to Dark mode'
elif [ "$mode" == "dark" ] ; then
    echo "light" > $HOME/.config/hypr/vars/mode
    $HOME/.config/hypr/scripts/wallpaper.sh "$wallpaper"
    notify-send 'Switched to Light mode'
fi
