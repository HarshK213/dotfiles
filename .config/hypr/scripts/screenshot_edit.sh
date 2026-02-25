#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"

# Capture region → edit → save
grim -g "$(slurp)" - | swappy -f - -o "$FILE"

# Copy edited result
wl-copy --type image/png < "$FILE"

notify-send "🖊 Annotated Screenshot" "Saved & copied to clipboard" -i "$FILE"