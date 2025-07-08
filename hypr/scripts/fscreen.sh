#!/bin/bash
# ~/.config/hypr/scripts/fullscreen_if_firefox.sh

active_class=$(hyprctl activewindow -j | grep class | cut -d '"' -f4)

if [[ "$active_class" == "firefox" ]]; then
  hyprctl dispatch fullscreen
fi

