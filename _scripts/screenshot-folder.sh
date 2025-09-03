#!/bin/bash

# Open the screenshots folder

SCREENSHOT_DIR="$HOME/Pictures/Screenshots/"

echo "[$(date)] Opening screenshots folder: $SCREENSHOT_DIR" >> /tmp/screenshot-handler.log

xdg-open "$SCREENSHOT_DIR"
