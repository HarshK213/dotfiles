#!/bin/bash

CACHE="$HOME/.cache/waybar-updates"
threshold_yellow=10
threshold_red=30

# Refresh every 15 minutes
if [[ ! -f $CACHE ]] || [[ $(find "$CACHE" -mmin +15) ]]; then
    (
        updates_arch=$(checkupdates 2>/dev/null | wc -l)
        updates_aur=$(yay -Qua 2>/dev/null | wc -l)
        echo $((updates_arch + updates_aur)) > "$CACHE"
    ) &
fi

updates=$(cat "$CACHE" 2>/dev/null || echo 0)

css_class="green"
[ "$updates" -gt $threshold_yellow ] && css_class="yellow"
[ "$updates" -gt $threshold_red ] && css_class="red"

printf '{"text":"%s","tooltip":"%s Updates","class":"%s"}' \
"$updates" "$updates" "$css_class"
