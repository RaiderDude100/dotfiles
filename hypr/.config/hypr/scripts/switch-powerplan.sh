#!/bin/bash

menu=$(printf "Default\nPerformance\nPowersave" | fuzzel --dmenu --lines=3 --width=40)

case "$menu" in
    Default) kitty -e ~/.config/hypr/scripts/powerplan.sh reset ;;
    Performance) kitty -e ~/.config/hypr/scripts/powerplan.sh performance ;;
    Powersave) kitty -e ~/.config/hypr/scripts/powerplan.sh powersave ;;
esac

