#!/bin/bash

OUTPUT="$HOME/Videos/rec_$(date +%Y-%m-%d_%H-%M-%S).mkv"

gpu-screen-recorder \
  -w eDP-1 \
  -f 60 \
  -o "$OUTPUT" \
  -fallback-cpu-encoding yes

notify-send "Recording Started" "$OUTPUT"
