#!/bin/bash

# Path to the Neovim server socket
SERVER_PIPE="/tmp/godot.pipe"

# Load NVM (Node Version Manager) for bash
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # Load nvm
    source "$NVM_DIR/nvm.sh"
    # Use Node.js v22 (or fallback to default if missing)
    nvm use 22 >/dev/null
else
    echo "NVM not found at $NVM_DIR" >&2
fi

# Debug: print node version to confirm
node -v >&2

# Launch Neovim via Alacritty
if [ -S "$SERVER_PIPE" ]; then
    # Reuse existing Neovim session
    nvim --server "$SERVER_PIPE" --remote "$1"
else
    # Start a new Neovim session
    alacritty -e nvim --listen "$SERVER_PIPE" "$1"
fi
