#!/bin/bash

STATE_FILE="$HOME/.cache/waybar-power-profile"

get_profile() {
  if command -v powerprofilesctl >/dev/null 2>&1; then
    powerprofilesctl get 2>/dev/null
  elif [[ -f "$STATE_FILE" ]]; then
    cat "$STATE_FILE"
  fi
}

PROFILE=$(get_profile)

case "$PROFILE" in
  performance)
    echo "{\"text\":\"  PERF\",\"class\":\"performance\"}"
    ;;
  balanced)
    echo "{\"text\":\"  BAL\",\"class\":\"medium\"}"
    ;;
  power-saver|*)
    echo "{\"text\":\"  ECO\",\"class\":\"powersaver\"}"
    ;;
esac
