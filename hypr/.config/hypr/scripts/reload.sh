#!/bin/bash

# Restart waybar
pkill waybar
waybar &

pkill swaync
swaync &

