#!/usr/bin/env bash

VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1 | tr -d '%')
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [[ "$MUTE" == "yes" ]]; then
  ICON="󰝟"
  TEXT="Muted"
else
  if (( VOL < 30 )); then
    ICON="󰕿"
  elif (( VOL < 70 )); then
    ICON="󰖀"
  else
    ICON="󰕾"
  fi
  TEXT="${VOL}%"
fi

echo "{\"text\": \"$ICON  $TEXT\"}" > /tmp/waybar-osd.json
pkill -RTMIN+10 waybar

# Auto-hide
(
  sleep 1.2
  echo '{"text": ""}' > /tmp/waybar-osd.json
  pkill -RTMIN+10 waybar
) &

