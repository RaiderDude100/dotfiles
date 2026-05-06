#!/bin/bash

menu=$(printf "Default\nPerformance\nPowersave" | fuzzel --dmenu --lines=3 --width=40)
terminal=$(cat ~/.config/hypr/vars/terminal)

case "$menu" in
    Default) $terminal -e ~/.config/hypr/scripts/powerplan.sh reset ;;
    Performance) $terminal -e ~/.config/hypr/scripts/powerplan.sh performance ;;
    Powersave) $terminal -e ~/.config/hypr/scripts/powerplan.sh powersave ;;
esac

