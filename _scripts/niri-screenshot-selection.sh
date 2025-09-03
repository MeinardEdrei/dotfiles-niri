#!/bin/bash

# Niri area screenshot with swaync notification

SCREENSHOT_DIR="$HOME/Pictures/Screenshots/"
mkdir -p "$SCREENSHOT_DIR"

niri msg action screenshot
sleep 0.5

LATEST=$(find "$SCREENSHOT_DIR" -name "Screenshot*.png" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)

if [[ -n "$LATEST" && -f "$LATEST" ]]; then
  notify-send -a "Niri Screenshot" -i "camera-photo" \
    --action="open_file=Open" \
    --action="open_folder=Open Folder" \
    "Screenshot" "Area screenshot saved: $(basename "$LATEST")"
else
  notify-send -a "Niri Screenshot" -i "dialog-error" \
    "Screenshot" "Failed to capture area"
fi
