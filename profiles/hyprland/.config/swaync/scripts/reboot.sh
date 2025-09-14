#!/bin/bash

zenity --question \
  --title="Reboot" \
  --text="Reboot in 10 seconds. Cancel?" \
  --timeout=10 \
  --ok-label="Reboot Now" \
  --cancel-label="Cancel"

if [ $? -eq 0 ]; then
  systemctl reboot
elif [ $? -eq 1 ]; then
  exit 1
else
  exit 1
fi
