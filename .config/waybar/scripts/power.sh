#!/bin/bash

mode=$(powerprofilesctl get)

case "$1" in
  toggle)
    case "$mode" in
      power-saver)
        powerprofilesctl set balanced
        ;;
      balanced)
        powerprofilesctl set performance
        ;;
      performance)
        powerprofilesctl set power-saver
        ;;
    esac
    exit
    ;;
esac

mode=$(powerprofilesctl get)

case "$mode" in
  power-saver)
    class="green"
    icon=""
    ;;
  balanced)
    class="blue"
    icon=""
    ;;
  performance)
    class="red"
    icon=""
    ;;
esac

printf '{"text":"%s","class":"%s","tooltip":"%s"}' "$icon" "$class" "$mode"
