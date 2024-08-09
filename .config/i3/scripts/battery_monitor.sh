#!/usr/bin/env bash

last_received_notification=""
while true; do
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ $battery_status != "Charging" ]; then
        if [ $battery_capacity -le 20 ] && [ $battery_capacity -gt 10 ] && [ "$last_received_notification" != "low" ]; then
            dunstify -u critical -h string:x-dunst-stack-tag:battery \
                "Low battery!" "The battery capacity is now at $battery_capacity%." && \
                last_received_notification="low"

        elif [ $battery_capacity -le 10 ] && [ $battery_capacity -gt 5 ] && [ "$last_received_notification" != "very low" ]; then
            dunstify -u critical -h string:x-dunst-stack-tag:battery \
                "Very low battery!" "The battery capacity is now at $battery_capacity%." && \
                last_received_notification="very low"

        elif [ $battery_capacity -le 5 ] && [ "$last_received_notification" != "critical" ]; then
            dunstify -u critical -h string:x-dunst-stack-tag:battery \
                "Critically low battery!" "The battery capacity is now at $battery_capacity%." && \
                last_received_notification="critical"
        fi
    fi

    sleep 60
done

