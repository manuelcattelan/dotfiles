#!/usr/bin/env bash

# Function to display script usage
echo_script_usage() {
    echo "Usage: $(basename "$0") <mode>"
    echo "Connect/disconnect bluetooth headphone with specified mode."
    echo
    echo "mode:"
    echo "  on audio       Connects to headphones with better audio quality, headphones microphone unavailable."
    echo "  on microphone  Connects to headphones with lower audio quality, headphones microphone available."
    echo "  off            Disconnects from headphones."
    echo
    echo "Examples:"
    echo "  $(basename "$0") on audio"
    echo "  $(basename "$0") on microphone"
    echo "  $(basename "$0") off"

    exit 1
}

# Connect or disconnect bluetooth headphones based on the provided mode
if [ "$1" == "on" ]; then
    # Bluetooth MAC address of headphones to connect to
    headphones_mac="B8:81:FA:AF:06:0D"
    # Bluetooth input card, source, and profile of headphones to connect to
    headphones_input_card="bluez_card.B8_81_FA_AF_06_0D"

    # Set different input profile based on requirements
    if [ "$2" == "audio" ]; then
        headphones_input_source="bluez_sink.B8_81_FA_AF_06_0D.a2dp_sink.monitor"
        headphones_input_profile="a2dp_sink"
    elif [ "$2" == "microphone" ]; then
        headphones_input_source="bluez_source.B8_81_FA_AF_06_0D.handsfree_head_unit"
        headphones_input_profile="handsfree_head_unit"
    else
        echo_script_usage
    fi

    # Power on bluetooth
    bluetoothctl power on

    # Connect and trust headphones via MAC address
    bluetoothctl connect "$headphones_mac"
    bluetoothctl trust "$headphones_mac"

    # Allow the changes to take effect
    sleep 1

    # Switch to the appropriate input profile and source
    pactl set-card-profile "$headphones_input_card" "$headphones_input_profile"
    pactl set-default-source "$headphones_input_source"
elif [ "$1" == "off" ]; then
    # Default input source to connect to
    default_input_source="alsa_input.pci-0000_64_00.6.HiFi__Mic1__source"

    # Power off bluetooth
    bluetoothctl power off

    # Allow the changes to take effect
    sleep 1

    # Switch to the default input source
    pactl set-default-source "$default_input_source"
else
    echo_script_usage
fi
