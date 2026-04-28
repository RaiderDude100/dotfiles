#!/bin/bash

menu=$(printf "Classic\nDefault\nEnd4\nHigh\nMoving\nStandard\nCustom\nNone" | fuzzel --dmenu --lines=8 --width=40)

case "$menu" in
    Classic) echo "classic" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/classic.conf" > ~/.config/hypr/conf/animations.conf ;;
    Default) echo "default" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/default.conf" > ~/.config/hypr/conf/animations.conf ;;
    End4) echo "end4" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/end4.conf" > ~/.config/hypr/conf/animations.conf ;;
    High) echo "high" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/high.conf" > ~/.config/hypr/conf/animations.conf ;;
    Moving) echo "moving" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/moving.conf" > ~/.config/hypr/conf/animations.conf ;;
    Standard) echo "standard" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/standard.conf" > ~/.config/hypr/conf/animations.conf ;;
    Custom) echo "custom" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/custom.conf" > ~/.config/hypr/conf/animations.conf ;;
    None) echo "none" > ~/.config/hypr/vars/animations && echo "source = ~/.config/hypr/conf/animations/none.conf" > ~/.config/hypr/conf/animations.conf ;;
esac

