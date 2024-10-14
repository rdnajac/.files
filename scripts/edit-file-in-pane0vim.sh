#!/bin/sh

# Check if the argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Resolve the full path of the file
fullpath=$(readlink -f "$1")

# Send the command to tmux
tmux send-keys -t 0 ":e $fullpath" Enter
tmux select-pane -t 0

