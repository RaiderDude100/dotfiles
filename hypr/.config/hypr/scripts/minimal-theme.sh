!/usr/bin/env sh
gsettings set org.gnome.desktop.interface gtk-theme "Graphite-Dark-compact"
echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/minimal\""\n    ],\n}" > ~/.config/waybar/config
echo "source = ~/.config/hypr/conf/look_feel/minimal.conf" > ~/.config/hypr/conf/look_feel.conf
echo "source = ~/.config/hypr/conf/animations/none.conf" > ~/.config/hypr/conf/animations.conf
echo "@import 'themes/minimal.css';" > ~/.config/waybar/style.css
~/.config/hypr/scripts/reload.sh
pkill swaync
echo "@theme \"~/.config/rofi/themes/minimal.rasi\"" > ~/.config/rofi/config.rasi
notify-send -e "Theme changed to Minimal"

