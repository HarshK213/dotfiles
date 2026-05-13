#!/bin/bash

MONITOR="eDP-1"

# Get current transform safely
CURRENT=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$MONITOR\") | .transform")

# ---------- TOGGLE LOGIC ----------
if [ "$CURRENT" = "3" ]; then
    TARGET=0
else
    TARGET=3
fi

# ---------- Apply rotation ----------
hyprctl keyword monitor "$MONITOR,preferred,auto,1,transform,$TARGET"

# ---------- Input adjustments ----------
if [ "$TARGET" = "3" ]; then
    hyprctl keyword input:sensitivity 0.0
else
    hyprctl keyword input:sensitivity 0.2
fi

# ---------- Notify ----------
#notify-send "Rotation toggled → $TARGET"
