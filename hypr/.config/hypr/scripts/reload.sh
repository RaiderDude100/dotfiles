#!/bin/bash

# Restart waybar
pkill waybar
pkill swaync
pkill thunar
waybar &
swaync &
thunar --daemon &
