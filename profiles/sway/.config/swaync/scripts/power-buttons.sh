#!/bin/bash

ACTION=$1

case "$ACTION" in
    "suspend")
        TITLE="Suspend"
        TEXT="Suspend in 10 seconds. Cancel?"
        LABEL="Suspend Now"
        CMD="systemctl suspend"
        ;;
    "reboot")
        TITLE="Reboot"
        TEXT="Reboot in 10 seconds. Cancel?"
        LABEL="Reboot Now"
        CMD="systemctl reboot"
        ;;
    "poweroff")
        TITLE="Power Off"
        TEXT="Power off in 10 seconds. Cancel?"
        LABEL="Power Off Now"
        CMD="systemctl poweroff"
        ;;
    *)
        notify-send "Power Script Error" "Invalid argument: $ACTION"
        exit 1
        ;;
esac

zenity --question \
  --title="$TITLE" \
  --width=380 \
  --text="$TEXT" \
  --timeout=10 \
  --ok-label="$LABEL" \
  --cancel-label="Cancel"

# Exit code 0 is clicking OK. Code 5 is the timeout expiring. Both should trigger the action.
if [ $? -eq 0 ] || [ $? -eq 5 ]; then
  $CMD
else
  exit 1
fi
