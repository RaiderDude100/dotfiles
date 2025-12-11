#!/bin/bash

pkill waybar # Kill waybar
pkill swaync # Kill swaync
waybar & # Start waybar
swaync & # Start swaync
