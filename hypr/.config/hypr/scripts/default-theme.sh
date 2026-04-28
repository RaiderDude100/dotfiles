#!/usr/bin/env sh

ln -sf ~/dotfiles/gtk-4/default/gtk-4.0/ ~/.config/
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"
echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/default.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc
echo "source = ~/.config/hypr/conf/look_feel/default.conf" > ~/.config/hypr/conf/look_feel.conf
echo "@import 'themes/default.css';" > ~/.config/waybar/style.css
echo "@import 'themes/osd-default.css';" > ~/.config/waybar/osd.css
echo "@import 'themes/default.css';" > ~/.config/swaync/style.css
echo "@import 'themes/default.css';" > ~/.config/gtk-3.0/gtk.css
echo "@import 'themes/default.css';" > ~/.config/gtk-4.0/gtk.css
echo "include=~/.config/mako/themes/default" > ~/.config/mako/config
echo -e "[main]\ninclude='~/.config/fuzzel/themes/default.ini'" > ~/.config/fuzzel/fuzzel.ini
~/.config/hypr/scripts/reload.sh
echo "@theme \"~/.config/rofi/themes/default.rasi\"" > ~/.config/rofi/config.rasi
notify-send -e "Theme changed to Default"
