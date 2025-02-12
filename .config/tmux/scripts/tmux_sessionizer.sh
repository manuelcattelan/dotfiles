#!/usr/bin/env bash

# Get the directory to open in a new tmux session
if [ "$#" -eq 1 ]; then
    directory_to_open="$1"
else
    directory_to_open=$(find \
            "$HOME/Programming" \
            "$HOME/Programming/work" \
            "$HOME/Programming/personal" \
            "$HOME/Programming/build" \
        -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Exit if no directory is selected
if [ -z "$directory_to_open" ]; then
    exit 1
fi

# Format the directory name for the tmux session name
tmux_session_name=$(basename "$directory_to_open" | tr '.' '_')

# Check if a tmux session is already running
if [ -z "$TMUX" ] && [ -z "$(pgrep tmux)" ]; then
    # Start a new tmux session if none is running
    tmux new-session -s "$tmux_session_name" -c "$directory_to_open"

    exit 0
elif ! tmux has-session -t="$tmux_session_name" 2>/dev/null; then
    # Start a new tmux session if the session doesn't already exist
    tmux new-session -ds "$tmux_session_name" -c "$directory_to_open"
fi

# Switch to the existing or newly created tmux session
tmux switch-client -t "$tmux_session_name"
