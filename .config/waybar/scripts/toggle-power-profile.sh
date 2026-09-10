#!/bin/bash

STATE_FILE="$HOME/.cache/waybar-power-profile"

get_profile() {
  if command -v powerprofilesctl >/dev/null 2>&1; then
    powerprofilesctl get 2>/dev/null
  elif [[ -f "$STATE_FILE" ]]; then
    cat "$STATE_FILE"
  fi
}

next_profile() {
  case "$1" in
    power-saver)
      echo "balanced"
      ;;
    balanced)
      echo "performance"
      ;;
    performance)
      echo "power-saver"
      ;;
    *)
      echo "balanced"
      ;;
  esac
}

CURRENT=$(get_profile)
NEXT=$(next_profile "$CURRENT")

if command -v powerprofilesctl >/dev/null 2>&1; then
  powerprofilesctl set "$NEXT"
else
  echo "$NEXT" > "$STATE_FILE"
fi

case "$NEXT" in
  power-saver) notify-send -i "battery" "Power Profile: Battery Saver" -t 1000 ;;
  balanced)    notify-send -i "battery" "Power Profile: Balanced" -t 1000 ;;
  performance) notify-send -i "battery" "Power Profile: Performance" -t 1000 ;;
esac
