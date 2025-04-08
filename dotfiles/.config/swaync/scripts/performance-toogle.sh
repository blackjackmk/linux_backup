#!/bin/bash

MODE=$(echo -e "Eco\nBalanced\nPerformance" | wofi --dmenu --prompt "Select Power Mode:")

case "$MODE" in
    "Eco") powerprofilesctl set power-saver ;;
    "Balanced") powerprofilesctl set balanced ;;
    "Performance") powerprofilesctl set performance ;;
esac

notify-send "Power Mode" "Set to: $MODE"
