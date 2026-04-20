#!/usr/bin/env sh

gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
ln -sf ~/dotfiles/gtk-4/default/gtk-4.0/ ~/.config/
echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/modern.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc
echo "source = ~/.config/hypr/conf/look_feel/default.conf" > ~/.config/hypr/conf/look_feel.conf
echo "@import 'themes/modern.css';" > ~/.config/waybar/style.css
echo "@import 'themes/osd-modern.css';" > ~/.config/waybar/osd.css
echo "@import 'themes/default.css';" > ~/.config/swaync/style.css
echo "@import 'themes/default.css';" > ~/.config/gtk-3.0/gtk.css
echo "@import 'themes/default.css';" > ~/.config/gtk-4.0/gtk.css
echo "include=~/.config/mako/themes/modern" > ~/.config/mako/config
~/.config/hypr/scripts/reload.sh
echo "@theme \"~/.config/rofi/themes/modern.rasi\"" > ~/.config/rofi/config.rasi
notify-send -e "Theme changed to Modern"
