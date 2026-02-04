#!/usr/bin/env bash

while true; do
  HOUR=$(date +%H)

  if [ "$HOUR" -ge 19 ] || [ "$HOUR" -lt 6 ]; then
    hyprsunset --temperature 3800
  else
    hyprsunset --temperature 6500
  fi

  sleep 600
done

