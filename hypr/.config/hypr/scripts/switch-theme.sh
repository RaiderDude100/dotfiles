#!/bin/bash

CURRENT_ANIMATION=$(cat ~/.config/hypr/vars/animations)
menu=$(printf "Default\nModern\nMinimal\nToggle Dark/Light Mode" | fuzzel --dmenu --lines=4 --width=40)

case "$menu" in
    Default) echo "default" > ~/.config/hypr/vars/theme && echo "source = ~/.config/hypr/conf/animations/$CURRENT_ANIMATION.conf" > ~/.config/hypr/conf/animations.conf && ~/.config/hypr/scripts/default-theme.sh ;;
    Modern) echo "modern" > ~/.config/hypr/vars/theme && echo "source = ~/.config/hypr/conf/animations/$CURRENT_ANIMATION.conf" > ~/.config/hypr/conf/animations.conf && ~/.config/hypr/scripts/modern-theme.sh ;;
    Minimal) echo "minimal" > ~/.config/hypr/vars/theme && echo "source = ~/.config/hypr/conf/animations/$CURRENT_ANIMATION.conf" > ~/.config/hypr/conf/animations.conf && ~/.config/hypr/scripts/minimal-theme.sh ;;
    'Toggle Light/Dark Mode') ~/.config/hypr/scripts/toggle-mode.sh ;;
esac

