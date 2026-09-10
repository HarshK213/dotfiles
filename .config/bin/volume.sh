#!/bin/bash

VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c "MUTED")
if [ "$MUTED" -eq 1 ]; then
  dunstify -h int:value:0 -i ~/.config/dunst/assets/volume.svg -t 500 -r 2593 "Volume: MUTED"
else
  dunstify -h int:value:"$VOL" -i ~/.config/dunst/assets/volume.svg -t 500 -r 2593 "Volume: ${VOL}%"
fi
