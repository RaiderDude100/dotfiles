!/usr/bin/env sh
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/default\""\n    ],\n}" > ~/.config/waybar/config
echo "source = ~/.config/hypr/conf/look_feel/default-borderless.conf" > ~/.config/hypr/conf/look_feel.conf
echo "@import 'themes/default-borderless.css';" > ~/.config/waybar/style.css
echo "@import 'themes/osd-default-borderless.css';" > ~/.config/waybar/osd.css
echo "@import 'themes/default-borderless.css';" > ~/.config/swaync/style.css
echo "@import 'themes/borderless.css';" > ~/.config/gtk-3.0/gtk.css
echo "@import 'themes/borderless.css';" > ~/.config/gtk-4.0/gtk.css
~/.config/hypr/scripts/reload.sh
pkill swaync
echo "@theme \"~/.config/rofi/themes/rounded-borderless.rasi\"" > ~/.config/rofi/config.rasi
notify-send -e "Theme changed to Default-Borderless"
