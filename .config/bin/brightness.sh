#!/bin/bash

BRIGHTNESS=$(brightnessctl -m | awk -F, '{print $4}' | tr -d %)
dunstify -h int:value:"$BRIGHTNESS" -i ~/.config/dunst/assets/brightness.svg -t 500 -r 2593 "Brightness: ${BRIGHTNESS}%"
