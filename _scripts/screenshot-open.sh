#!/bin/bash

# Open the latest screenshot

SCREENSHOT_DIR="$HOME/Pictures/Screenshots/"

# Find the latest screenshot file
LATEST=$(find "$SCREENSHOT_DIR" -name "Screenshot*.png" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)

echo "[$(date)] Opening latest screenshot: '$LATEST'" >> /tmp/screenshot-handler.log

if [[ -n "$LATEST" && -f "$LATEST" ]]; then
    xdg-open "$LATEST"
else
    notify-send -a "Niri Screenshot" -i "dialog-error" "Error" "No recent screenshot found"
fi
