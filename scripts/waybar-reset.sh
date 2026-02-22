#!/bin/bash

# 1. Kill any running peek scripts
pkill -f waybar-locker.sh

# 2. Delete the lock file
rm -f /tmp/waybar_locker.lock

# 3. Force Waybar to HIDE if it's currently showing
# We check the layers; if it's there, we toggle it off.
if hyprctl layers | grep -q "waybar"; then
    killall -SIGUSR1 waybar
fi

# 4. Final check: if Waybar crashed entirely, restart it
if ! pgrep -x "waybar" > /dev/null; then
    waybar &
    sleep 0.5
    killall -SIGUSR1 waybar
fi
