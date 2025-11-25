MENU="Default|Minimal"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Select Theme" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Default" ];
then
	exec ~/.config/hypr/scripts/default-theme.sh

elif [ "$DIALOG_RESULT" = "Minimal" ];
then
	exec ~/.config/hypr/scripts/minimal-theme.sh
fi
