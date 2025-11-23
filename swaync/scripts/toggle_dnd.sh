#!/bin/bash

# Toggle the DND state in SwayNC
swaync-client --toggle-dnd

# Wait a split second for the state to update
sleep 0.1

# Check the new state directly from the client
IS_DND=$(swaync-client -D)

if [ "$IS_DND" == "true" ]; then
    notify-send -u low "Do Not Disturb" "Enabled - Notifications Silenced"
else
    notify-send -u low "Do Not Disturb" "Disabled - Notifications Active"
fi
