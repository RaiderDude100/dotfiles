#!/bin/sh

mode="$(cat $HOME/.config/hypr/vars/mode)"
wallpaper="$(cat $HOME/.config/hypr/vars/wallpaper)"

if [ "$mode" == "Light" ] ; then
    echo "Dark" > $HOME/.config/hypr/vars/mode
    $HOME/.config/hypr/scripts/wallpaper.sh "$wallpaper"
    gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    sleep 1
    notify-send 'Switched to Dark mode'
elif [ "$mode" == "Dark" ] ; then
    echo "Light" > $HOME/.config/hypr/vars/mode
    $HOME/.config/hypr/scripts/wallpaper.sh "$wallpaper"
    gsettings set org.gnome.desktop.interface gtk-theme "Graphite-Light-compact"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    sleep 1
    notify-send 'Switched to Light mode'
fi
