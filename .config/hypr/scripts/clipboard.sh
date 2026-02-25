#!/bin/bash

# If rofi is already running → kill it (toggle behavior)
if pgrep -x rofi >/dev/null; then
    pkill rofi
    exit 0
fi

# Show clipboard history
cliphist list | rofi -dmenu -i -p "Clipboard" | cliphist decode | wl-copy
