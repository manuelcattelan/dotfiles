#!/usr/bin/env bash

configure_monitors() {
    # Get the list of connected monitors
    connected_monitors=$(xrandr --query | grep " connected" | cut -d' ' -f1)

    # Check if there's at least one external monitor connected
    if [ $(echo "$connected_monitors" | wc -l) -gt 1 ]; then
        command_to_execute="xrandr"

        # Check if the left external monitor is connected
        if xrandr --query | grep -q "HDMI-1 connected"; then
            command_to_execute+=" --output HDMI-1 --auto"
        fi

        # Check if the right external monitor is connected
        if xrandr --query | grep -q "DP-1 connected"; then
            command_to_execute+=" --output DP-1 --auto --right-of HDMI-1 --scale 1.5x1.5"
        fi

        if [ $(echo "$connected_monitors" | wc -l) -gt 2 ]; then
            # Disable the laptop's monitor if there's two external monitors connected
            command_to_execute+=" --output eDP-1 --off"
        else
            # Enable the laptop's monitor if there's only one external monitor connected
            command_to_execute+=" --output eDP-1 --on"
        fi

        eval "$command_to_execute"
    else
        # Enable the laptop's monitor
        command_to_execute="xrandr --output eDP-1 --auto"

        eval "$command_to_execute"
    fi
}

# Set the correct configuration for all connected monitors
configure_monitors

configure_udev() {
    udevadm monitor --subsystem-match=drm --udev | while read -r line; do
        if [[ $line == *"change"* ]] && [[ $line == *"drm"* ]]; then
            # Sleep for 1 second to allow the monitors' configuration to be updated
            sleep 1

            # Set the correct configuration for all connected monitors
            configure_monitors
            # Set the wallpaper on all connected monitors
            source ~/.config/i3/scripts/configure_background.sh
        fi
    done
}

# Monitor udev events in the background
(configure_udev) &

# Detach the process from the script so that monitoring will continue running
# when the script exits.
disown $!
