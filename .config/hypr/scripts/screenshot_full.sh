#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"

grim "$FILE"

sleep 0.1

wl-copy --type image/png < "$FILE"

notify-send "📸 Screenshot Taken" "Saved & copied to clipboard" -i "$FILE"