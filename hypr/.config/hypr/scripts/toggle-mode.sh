#!/bin/sh

mode="$(cat $HOME/.config/hypr/vars/mode)"
wallpaper="$(cat $HOME/.config/hypr/vars/wallpaper)"
theme="$(cat $HOME/.config/hypr/vars/theme)"

if [ "$mode" == "Light" ] ; then
    echo "Dark" > $HOME/.config/hypr/vars/mode
    $HOME/.config/hypr/scripts/wallpaper.sh "$wallpaper"
    if [ "$theme" == "minimal" ] ; then
        gsettings set org.gnome.desktop.interface gtk-theme "Graphite-Dark-compact"
    fi
    sleep 1
    notify-send 'Switched to Dark mode'
elif [ "$mode" == "Dark" ] ; then
    echo "Light" > $HOME/.config/hypr/vars/mode
    $HOME/.config/hypr/scripts/wallpaper.sh "$wallpaper"
    if [ "$theme" == "minimal" ] ; then
        gsettings set org.gnome.desktop.interface gtk-theme "Graphite-Light-compact"
    fi
    sleep 1
    notify-send 'Switched to Light mode'
fi
