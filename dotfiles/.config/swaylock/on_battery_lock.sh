#!/bin/sh
if upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -q "state:\s*discharging"; then
  echo "on_battery"
else
  echo "on_ac"
fi
