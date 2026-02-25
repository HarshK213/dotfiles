#!/bin/bash

state=$(nmcli radio wifi)

choice=$(printf "Manager\nToggle WiFi\nDisconnect" | rofi -dmenu -p "WiFi")

case "$choice" in
  Manager)
    nmgui &
    ;;
  Toggle\ WiFi)
    if [ "$state" = "enabled" ]; then
      nmcli radio wifi off
    else
      nmcli radio wifi on
    fi
    ;;
  Disconnect)
    nmcli device disconnect wlan0 2>/dev/null
    ;;
esac
