#!/usr/bin/env bash

STATE="$HOME/.cache/waybar-osd.json"

if [[ -f "$STATE" ]]; then
  cat "$STATE"
else
  echo '{"text": ""}'
fi

