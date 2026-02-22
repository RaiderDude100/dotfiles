MENU="Default|Performance|Powersave"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Switch System Powerplan" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Default" ];then
    kitty -e ~/.config/hypr/scripts/powerplan.sh reset

elif [ "$DIALOG_RESULT" = "Performance" ];then
    kitty -e ~/.config/hypr/scripts/powerplan.sh performance

elif [ "$DIALOG_RESULT" = "Powersave" ];then
    kitty -e ~/.config/hypr/scripts/powerplan.sh powersave
fi

