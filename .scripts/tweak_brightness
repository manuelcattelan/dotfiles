#!/usr/bin/env bash

# Function to display script usage
echo_script_usage() {
    echo "Usage: $(basename "$0") <offset>"
    echo "Increase/decrease screen brightness by a percentage offset N."
    echo
    echo "offset:"
    echo "  +N%  Increases screen brightness by N% from current value, where N is any integer value."
    echo "  N%-  Decreases screen brightness by N% from current value, where N is any integer value."
    echo
    echo "Examples:"
    echo "  $(basename "$0") +10%"
    echo "  $(basename "$0") 10%-"

    exit 1
}

# Adjust the screen brightness based on the provided offset
if [ -n "$1" ] && [[ "$1" =~ ^(\+[0-9]+%|[0-9]+%-)$ ]]; then
    brightnessctl set "$1"

    brightness_value_raw=$(brightnessctl get)
    brightness_value_mapped=$((brightness_value_raw * 100 / 255 / 10 * 10))

    dunstify "Brightness tweaked!" "Brightness is now at ~$brightness_value_mapped%." \
        -u low -h string:x-dunst-stack-tag:brightness
else
    echo_script_usage
fi
