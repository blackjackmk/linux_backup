#!/bin/bash

if pgrep -x wlsunset >/dev/null; then
    pkill wlsunset
    notify-send "Night Light" "Disabled"
else
    wlsunset -t 4500 -T 6500 -g 0.8 &
    notify-send "Night Light" "Enabled"
fi
