#!/bin/bash

LOCK="/tmp/waybar_locker.lock"

# If the lock exists, the bar is already showing. Exit and do nothing.
[ -f "$LOCK" ] && exit 0

# 1. Create the lock and show the bar
touch "$LOCK"
killall -SIGUSR1 waybar

# 2. Wait seconds
sleep 6.66

# 3. Hide the bar and remove the lock
killall -SIGUSR1 waybar
rm "$LOCK"
