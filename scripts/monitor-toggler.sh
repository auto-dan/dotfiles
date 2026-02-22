#!/bin/bash

# Check if laptop screen is currently enabled
if hyprctl monitors | grep -q "Monitor eDP-1"; then
    # Laptop is on, switch to external
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,2560x1440@144,0x0,1"
    # Move all workspaces to the active monitor
    hyprctl dispatch moveworkspacetomonitor 1 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 3 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 4 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 5 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 6 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 7 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 8 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 8 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 10 HDMI-A-1
else
    # External is on, switch to laptop
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
    hyprctl keyword monitor "HDMI-A-1,disable"
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
