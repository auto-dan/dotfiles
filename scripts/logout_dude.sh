#!/bin/bash

# get deps
if ! command -v xdotool &> /dev/null; then
        echo "xdotool not found, installing..."
        sudo apt update
        sudo apt install xdotool -y
fi

# discover window id so we only send commands to the client
target_window_id=$(xdotool search --name "Path of Exile")
if [[ -z "$target_window_id" ]]; then
        echo "Target application window not found. Exiting..."
        exit 1
fi
# now set the window as the target for xdotool
# requires a slight delay for focus switching...
xdotool windowactivate "$target_window_id"
sleep .1

# query xinput for the id of my mouse receiver by name
MOUSE_ID=$(xinput list --id-only "Logitech USB Receiver")

# disable that shit so if I am panicing it does not matter
xinput disable "$MOUSE_ID"

# log sequence w required input delays
xdotool key Space
xdotool key Escape
sleep .1
xdotool mousemove 1905 945
sleep .1
xdotool click 1

# enable so you can log back in to your living character
xinput enable "$MOUSE_ID"
