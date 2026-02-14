#!/bin/bash

TEMPERATURE=3800
CHECK_INTERVAL=600 # 5 minutes in seconds

while true; do
    HOUR=$(date +%H)
    
    # Check if current hour is between 19 (7pm) and 7 (7am)
    if [ "$HOUR" -ge 19 ] || [ "$HOUR" -lt 7 ]; then
        # Apply warm temperature
        hyprsunset -t "$TEMPERATURE"
    else
        # Reset to normal temperature
        pkill hyprsunset
    fi
    
    sleep $CHECK_INTERVAL
done
