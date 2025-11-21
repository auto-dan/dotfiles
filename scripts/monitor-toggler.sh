#!/bin/bash

# Check if laptop screen is currently enabled
if hyprctl monitors | grep -q "Monitor eDP-1"; then
    # Laptop is on, switch to external
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "DP-3,2560x1440@144,0x0,1"
    # Move all workspaces to the active monitor
    hyprctl dispatch moveworkspacetomonitor 1 DP-3
    hyprctl dispatch moveworkspacetomonitor 2 DP-3
    hyprctl dispatch moveworkspacetomonitor 3 DP-3
    hyprctl dispatch moveworkspacetomonitor 4 DP-3
    hyprctl dispatch moveworkspacetomonitor 5 DP-3
    hyprctl dispatch moveworkspacetomonitor 6 DP-3
    hyprctl dispatch moveworkspacetomonitor 7 DP-3
    hyprctl dispatch moveworkspacetomonitor 8 DP-3
    hyprctl dispatch moveworkspacetomonitor 8 DP-3
    hyprctl dispatch moveworkspacetomonitor 10 DP-3
else
    # External is on, switch to laptop
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
    hyprctl keyword monitor "DP-3,2560x1440@144,0x0,1"
    # Move all workspaces back to laptop
    hyprctl dispatch moveworkspacetomonitor 1 eDP-1
    hyprctl dispatch moveworkspacetomonitor 2 eDP-1
    hyprctl dispatch moveworkspacetomonitor 3 eDP-1
    hyprctl dispatch moveworkspacetomonitor 4 eDP-1
    hyprctl dispatch moveworkspacetomonitor 5 eDP-1
    hyprctl dispatch moveworkspacetomonitor 6 eDP-1
    hyprctl dispatch moveworkspacetomonitor 7 eDP-1
    hyprctl dispatch moveworkspacetomonitor 8 eDP-1
    hyprctl dispatch moveworkspacetomonitor 8 eDP-1
    hyprctl dispatch moveworkspacetomonitor 10 eDP-1
fi
