#!/bin/bash

if pgrep -x gammastep >/dev/null; then
    pkill gammastep
    notify-send "Night Light" "Disabled"
else
    gammastep -P -O 4500 &
    notify-send "Night Light" "Enabled (4500K)"
fi
