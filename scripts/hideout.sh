#!/bin/bash

if ! command -v xdotool &> /dev/null; then
	echo "xdotool not found, installing..."
	sudo apt update
	sudo apt install xdotool -y
fi

target_window_id=$(xdotool search --name "Path of Exile")

if [[ -z "$target_window_id" ]]; then
	echo "Target application window not found. Exiting..."
	exit 1
fi

keyboard_id=12

disable_keyboard() {
	xinput float $keyboard_id
}

enable_keyboard() {
	xinput reattach $keyboard_id
}


#disable_keyboard
xdotool windowactivate "$target_window_id"
sleep .1
xdotool key Return
xdotool type --delay .1 '/hideout'
xdotool key Return
#enable_keyboard
