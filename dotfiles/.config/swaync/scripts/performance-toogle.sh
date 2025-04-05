#!/bin/bash

current=$(cat /sys/firmware/acpi/platform_profile)

if [[ "$current" == "performance" ]]; then
  echo "balanced" | sudo tee /sys/firmware/acpi/platform_profile
  notify-send "Mode: Balanced"
else
  echo "performance" | sudo tee /sys/firmware/acpi/platform_profile
  notify-send "Mode: Performance"
fi
