#!/bin/bash

# Check if swww is running and kill it
if pgrep -x "swww" >/dev/null; then
  killall swww
fi

TARGET="$HOME/wallpaper"

WALLPAPER=$(find "$TARGET" -type f -iregex '.*\.\(jpg\|jpeg\|png\|webp\)' | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
  echo "Error: No wallpapers found in $TARGET."
  exit 1
fi

if ! pgrep -x "swww" >/dev/null; then
  swww init
  sleep 1
fi

animations=(
  outer
  wipe
  fade
  # ngrow
  center
  random
)

# Pick a random animation
selected_animation=$(printf "%s\n" "${animations[@]}" | shuf -n1)

# Set wallpaper with random animation
swww img "$WALLPAPER" \
  --transition-type "$selected_animation" \
  --transition-fps 144 \
  --transition-duration 1

echo "Wallpaper set to: $WALLPAPER"
