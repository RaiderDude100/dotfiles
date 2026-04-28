#!/bin/bash

CURRENT_ANIMATION=$(cat ~/.config/hypr/vars/animations)
menu=$(printf "Default\nModern\nMinimal" | fuzzel --dmenu --lines=3 --width=40)

case "$menu" in
    Default) echo "default" > ~/.config/hypr/vars/waybar-theme && echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/default.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc && echo "@import 'themes/default.css';" > ~/.config/waybar/style.css && echo "@import 'themes/osd-default.css';" > ~/.config/waybar/osd.css ;;
    Modern) echo "modern" > ~/.config/hypr/vars/waybar-theme && echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/modern.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc && echo "@import 'themes/modern.css';" > ~/.config/waybar/style.css && echo "@import 'themes/osd-modern.css';" > ~/.config/waybar/osd.css ;;
    Minimal) echo "minimal" > ~/.config/hypr/vars/waybar-theme && echo -e "{\n    "\"include\"": [\n    "\"~/.config/waybar/themes/minimal.jsonc\""\n    ],\n}" > ~/.config/waybar/config.jsonc && echo "@import 'themes/minimal.css';" > ~/.config/waybar/style.css && echo "@import 'themes/osd-minimal.css';" > ~/.config/waybar/osd.css ;;
esac
~/.config/hypr/scripts/reload.sh

