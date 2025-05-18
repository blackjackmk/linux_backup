#!/bin/bash

zenity --question \
  --title="Suspend" \
  --text="Susspend in 10 seconds. Cancel?" \
  --timeout=10 \
  --ok-label="Suspend Now" \
  --cancel-label="Cancel"

if [ $? -eq 0 ]; then
  systemctl suspend
elif [ $? -eq 1 ]; then
  exit 1
else
  exit 1
fi
