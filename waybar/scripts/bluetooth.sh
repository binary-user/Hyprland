#!/bin/bash

# Check if Bluetooth is powered on
power_state=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [[ $power_state == "yes" ]]; then
    # Get connected devices
    connected_device=$(bluetoothctl info | grep "Device" | awk '{print $2}')
    if [ -n "$connected_device" ]; then
        echo "󰂱 $(bluetoothctl info $connected_device | grep 'Alias' | awk '{print $2}')"
    else
        echo "󰂯"
    fi
else
    echo "󰂲"
fi

