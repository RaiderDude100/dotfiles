!/usr/bin/env sh
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/default\""\n    ],\n}" > ~/.config/waybar/config
echo "source = ~/.config/hypr/conf/look_feel/default.conf" > ~/.config/hypr/conf/look_feel.conf
echo "source = ~/.config/hypr/conf/animations/default.conf" > ~/.config/hypr/conf/animations.conf
echo "@import 'themes/default.css';" > ~/.config/waybar/style.css
echo "@import 'themes/default.css';" > ~/.config/swaync/style.css
~/.config/hypr/scripts/reload.sh
pkill swaync
echo "@theme \"~/.config/rofi/themes/rounded.rasi\"" > ~/.config/rofi/config.rasi
notify-send -e "Theme changed to Default"

