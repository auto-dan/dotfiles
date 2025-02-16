#!/bin/bash
SERVER_PIPE="/tmp/godot.pipe"

# Check if the Neovim server is running
if [ -S "$SERVER_PIPE" ]; then
    # Send the file to the existing Neovim session
    nvim --server "$SERVER_PIPE" --remote "$1"
else
    # Start a new Neovim session if one doesn't exist
    alacritty -e nvim --listen "$SERVER_PIPE" "$1"
fi
