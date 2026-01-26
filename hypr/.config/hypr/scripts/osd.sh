#!/usr/bin/env bash

STATE="/tmp/waybar-osd.json"

if [[ -f "$STATE" ]]; then
  cat "$STATE"
else
  echo '{"text": ""}'
fi

