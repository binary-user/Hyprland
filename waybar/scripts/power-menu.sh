#!/bin/bash

# Define the options
options=("Lock" "Logout" "Suspend" "Reboot" "Shutdown")

# Use rofi to create a menu and get user selection
selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Power Menu")

# Handle the selected option
case $selected in
    "Lock")
        swaylock
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac
