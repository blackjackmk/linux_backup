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
fi
