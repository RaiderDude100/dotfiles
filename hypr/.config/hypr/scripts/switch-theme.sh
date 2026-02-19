MENU="Default|Default-Borderless|Minimal"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Select Theme" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

CURRENT_ANIMATION=$(cat ~/.config/hypr/vars/animations)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Default" ];then
    echo "default" > ~/.config/hypr/vars/theme
    echo "source = ~/.config/hypr/conf/animations/$CURRENT_ANIMATION.conf" > ~/.config/hypr/conf/animations.conf
    exec ~/.config/hypr/scripts/default-theme.sh

elif [ "$DIALOG_RESULT" = "Default-Borderless" ];then
    echo "default-borderless" > ~/.config/hypr/vars/theme
    echo "source = ~/.config/hypr/conf/animations/$CURRENT_ANIMATION.conf" > ~/.config/hypr/conf/animations.conf
	exec ~/.config/hypr/scripts/default-borderless-theme.sh

elif [ "$DIALOG_RESULT" = "Minimal" ];then
    echo "minimal" > ~/.config/hypr/vars/theme
    echo "source = ~/.config/hypr/conf/animations/none.conf" > ~/.config/hypr/conf/animations.conf
	exec ~/.config/hypr/scripts/minimal-theme.sh
fi
