#!/bin/sh

MENU="Default|Dynamic Island|Minimal"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Select Waybar Theme" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Default" ];then
    echo "default" > ~/.config/hypr/vars/waybar-theme
	echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/default.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc
    echo "@import 'themes/default.css';" > ~/.config/waybar/style.css
	echo "@import 'themes/osd-default.css';" > ~/.config/waybar/osd.css

elif [ "$DIALOG_RESULT" = "Dynamic Island" ];then
    echo "dynamic-island" > ~/.config/hypr/vars/waybar-theme
	echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/dynamic-island.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc
    echo "@import 'themes/dynamic-island.css';" > ~/.config/waybar/style.css
	echo "@import 'themes/osd-dynamic-island.css';" > ~/.config/waybar/osd.css

elif [ "$DIALOG_RESULT" = "Minimal" ];then
    echo "minimal" > ~/.config/hypr/vars/waybar-theme
	echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/minimal.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc
    echo "@import 'themes/minimal.css';" > ~/.config/waybar/style.css
	echo "@import 'themes/osd-minimal.css';" > ~/.config/waybar/osd.css
fi
~/.config/hypr/scripts/reload.sh


