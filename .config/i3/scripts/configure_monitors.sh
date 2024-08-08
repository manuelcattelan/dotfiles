#!/usr/bin/env bash

# Function to configure connected monitors
configure_monitors() {
    # Get the list of connected monitors
    connected_monitors=$(xrandr --query | grep " connected" | cut -d' ' -f1)

    # Check if there's at least one external monitor connected
    if [ "$(echo "$connected_monitors" | wc -l)" -gt 1 ]; then
        monitor_config_command="xrandr"

        # Check if the left external monitor is connected
        if xrandr --query | grep -q "HDMI-1 connected"; then
            monitor_config_command+=" --output HDMI-1 --auto"
        fi

        # Check if the right external monitor is connected
        if xrandr --query | grep -q "DP-1 connected"; then
            monitor_config_command+=" --output DP-1 --auto --right-of HDMI-1 --scale 1.5x1.5"
        fi

        if [ "$(echo "$connected_monitors" | wc -l)" -gt 2 ]; then
            # Disable the laptop's monitor if there's two external monitors connected
            monitor_config_command+=" --output eDP-1 --off"
        else
            # Enable the laptop's monitor if there's only one external monitor connected
            monitor_config_command+=" --output eDP-1 --on"
        fi

        eval "$monitor_config_command"
    else
        # Enable the laptop's monitor if no external monitors are connected
        eval "xrandr --output eDP-1 --auto"
    fi
}

# Set the correct configuration for all connected monitors
configure_monitors

# Function to monitor udev events and reconfigure monitors when changes occur
configure_udev() {
    udevadm monitor --subsystem-match=drm --udev | while read -r line; do
        if [[ $line == *"change"* ]] && [[ $line == *"drm"* ]]; then
            # Sleep for 1 second to allow the monitors' configuration to be updated
            sleep 1
            # Set the correct configuration for all connected monitors
            configure_monitors
            # Set the wallpaper on all connected monitors
            source "$HOME/.config/i3/scripts/configure_background.sh"
        fi
    done
}

# Monitor udev events in the background
(configure_udev) &

# Detach the process from the script so that monitoring will continue running
# when the script exits.
disown $!
