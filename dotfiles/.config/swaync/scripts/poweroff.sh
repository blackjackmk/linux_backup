#!/bin/bash

zenity --question \
  --title="Power Off" \
  --width=380 \
  --text="Power off in 10 seconds. Cancel?" \
  --timeout=10 \
  --ok-label="Power Off Now" \
  --cancel-label="Cancel"

if [ $? -eq 0 ]; then
  systemctl poweroff
elif [ $? -eq 1 ]; then
  exit 1
else
  exit 1
fi

