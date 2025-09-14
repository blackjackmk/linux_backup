#!/bin/bash
LIST=$(wpctl status | sed -n '/Sinks:/,/Sources:/p'| grep -A100 "Sinks" | grep -E '[0-9]+\. ' | sed -E 's/^[[:space:]]*[\|│]*[[:space:]]*\*?[[:space:]]*//')
CHOICE=$(echo "$LIST" | wofi --dmenu --prompt="Select Output" |  awk -F. '{print $1}')

if [[ -n "$CHOICE" ]]; then
    wpctl set-default "$CHOICE"
    notify-send "Audio Output" "Switched to $CHOICE"
fi
