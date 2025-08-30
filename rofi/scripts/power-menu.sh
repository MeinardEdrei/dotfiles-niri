#!/bin/bash

set -e

# Configuration
THEME_PATH="$HOME/.config/rofi/themes/power-menu.rasi"
LOCK_CMD="hyprlock"

# Check if theme exists, use it if available
THEME_ARGS=""
if [[ -f "$THEME_PATH" ]]; then
    THEME_ARGS="-theme $THEME_PATH"
fi

# Confirmation function for destructive actions
confirm_action() {
    local message="$1"
    
    local choice=$(printf "Yes\nNo" | \
        rofi -dmenu -i \
        -p "$message" \
        -selected-row 1 \
        -kb-row-down "Down,j" \
        -kb-row-up "Up,k" \
        -kb-accept-entry "Return" \
        -kb-cancel "Escape" \
        $THEME_ARGS)
    
    [[ "$choice" == "Yes" ]]
}

# Main menu
chosen=$(printf "󰐥  Power Off\n󰜉  Restart\n󰒲  Suspend\n󰋊  Hibernate\n󰍃  Log Out\n󰌾  Lock" | \
    rofi -dmenu -i \
    -p "" \
    -hide-scrollbar \
    -disable-history \
    -kb-text-clear "" \
    -kb-remove-to-eol "" \
    -kb-remove-word-back "" \
    -kb-remove-word-forward "" \
    -kb-row-down "Down,j" \
    -kb-row-up "Up,k" \
    -kb-accept-entry "Return" \
    -kb-cancel "Escape" \
    -selected-row 0 \
    $THEME_ARGS)

# Handle selection
case "$chosen" in
    "󰐥  Power Off")
        if confirm_action "Power off the system?"; then
            systemctl poweroff
        fi
        ;;
    "󰜉  Restart")
        if confirm_action "Restart the system?"; then
            systemctl reboot
        fi
        ;;
    "󰒲  Suspend")
        systemctl suspend && sleep 1 && $LOCK_CMD
        ;;
    "󰋊  Hibernate")
        if confirm_action "Hibernate the system?"; then
            systemctl hibernate
        fi
        ;;
    "󰍃  Log Out")
        if confirm_action "Log out of session?"; then
            hyprctl dispatch exit
        fi
        ;;
    "󰌾  Lock")
        $LOCK_CMD
        ;;
    "")
        # User cancelled
        exit 0
        ;;
    *)
        exit 1
        ;;
esac
