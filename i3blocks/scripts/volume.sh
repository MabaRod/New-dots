#!/bin/bash

get_volume() {
    amixer get Master | grep -oP '\[\d{1,3}%\]' | head -1 | tr -d '[]'
}

get_mute() {
    amixer get Master | grep -q '\[off\]'
}

case $BLOCK_BUTTON in
    1) amixer set Master toggle ;;        # Left click to toggle mute
    4) amixer set Master 2%+ ;;           # Scroll up
    5) amixer set Master 2%- ;;           # Scroll down
esac

vol=$(get_volume)
get_mute && echo "$vol" || echo "$vol"

