#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots/"

# Debug log
echo "[$(date)] Action: '$1', Hint: '$SWAYNC_NOTIFICATION_HINT_screenshot_path'" >> /tmp/screenshot-handler.log

case "$1" in
  "open")
    FILE="${SWAYNC_NOTIFICATION_HINT_screenshot_path}"
    echo "[$(date)] Trying to open file: '$FILE'" >> /tmp/screenshot-handler.log
    
    if [ -n "$FILE" ] && [ -f "$FILE" ]; then
      echo "[$(date)] File exists, opening..." >> /tmp/screenshot-handler.log
      xdg-open "$FILE"
    else
      echo "[$(date)] File not found or empty" >> /tmp/screenshot-handler.log
      notify-send -a "Niri Screenshot" -i "dialog-error" "Error" "Screenshot file not found: $FILE"
    fi
    ;;
  "folder")
    echo "[$(date)] Opening folder: $SCREENSHOT_DIR" >> /tmp/screenshot-handler.log
    xdg-open "$SCREENSHOT_DIR"
    ;;
  *)
    echo "[$(date)] Invalid action: $1" >> /tmp/screenshot-handler.log
    ;;
esac
