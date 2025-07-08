#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null)

# Try to get remaining time with upower
device=$(upower -e | grep BAT)
time_remaining=""

if [ "$status" = "Discharging" ]; then
    time_remaining=$(upower -i "$device" | awk '/time to empty/ {print $4, $5}')
elif [ "$status" = "Charging" ]; then
    time_remaining=$(upower -i "$device" | awk '/time to full/ {print $4, $5}')
fi

# Show time on right-click
case $BLOCK_BUTTON in
    3)
        echo "$capacity% ($time_remaining)"
        ;;
    *)
        if [ "$status" = "Charging" ]; then
            echo "$capacity% 🔌 "
        else
            echo "$capacity% "
        fi
        ;;
esac

# Optional tooltip simulation (commented out if not supported)
# echo "$capacity% | <span font_desc='small'>$time_remaining</span>"

