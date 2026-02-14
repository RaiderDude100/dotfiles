#!/bin/sh

MENU="Classic|Default|End4|High|Moving|Standard|Custom|None"

DIALOG_RESULT=$(echo $MENU | rofi -sep "|" -dmenu -i -p "Select Animations" -hide-scrollbar -tokenize -lines 5 -width 50 -padding 50 -disable-history)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Classic" ];then

	echo "source = ~/.config/hypr/conf/animations/classic.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Default" ];then
    echo "default" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/default.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "End4" ];then
    echo "end4" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/end4.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "High" ];then
    echo "high" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/high.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Moving" ];then
    echo "moving" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/moving.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Standard" ];then
    echo "standard" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/standard.conf" > ~/.config/hypr/conf/animations.conf

elif [ "$DIALOG_RESULT" = "Custom" ];then
    echo "custom" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/custom.conf" > ~/.config/hypr/conf/animations.conf
	
elif [ "$DIALOG_RESULT" = "None" ];then
    echo "none" > ~/.config/hypr/vars/animations
	echo "source = ~/.config/hypr/conf/animations/none.conf" > ~/.config/hypr/conf/animations.conf
fi


