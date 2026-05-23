#!/bin/bash

menu=$(printf "Classic\nDefault\nEnd4\nHigh\nMoving\nStandard\nCustom\nNone" | fuzzel --dmenu --lines=8 --width=40)

case "$menu" in
    Default) echo "default" > ~/.config/hypr/vars/animations && echo 'require("conf.animations.default")' > ~/.config/hypr/conf/animations.lua ;;
    None) echo "none" > ~/.config/hypr/vars/animations && echo 'require("conf.animations.none")' > ~/.config/hypr/conf/animations.lua ;;
esac
