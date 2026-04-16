#!/usr/bin/env sh

mode=$(cat ~/.config/hypr/vars/mode)

gsettings set org.gnome.desktop.interface gtk-theme "Graphite-'$mode'-compact"
ln -sf ~/dotfiles/gtk-4/minimal/gtk-4.0 ~/.config/
echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/minimal.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc
echo "source = ~/.config/hypr/conf/look_feel/minimal.conf" > ~/.config/hypr/conf/look_feel.conf
echo "@import 'themes/minimal.css';" > ~/.config/waybar/style.css
echo "@import 'themes/osd-minimal.css';" > ~/.config/waybar/osd.css
echo "@import 'themes/minimal.css';" > ~/.config/swaync/style.css
echo "@import 'themes/minimal.css';" > ~/.config/gtk-3.0/gtk.css
echo "include=~/.config/mako/themes/minimal" > ~/.config/mako/config
~/.config/hypr/scripts/reload.sh
echo "@theme \"~/.config/rofi/themes/minimal.rasi\"" > ~/.config/rofi/config.rasi
notify-send -e "Theme changed to Minimal"
