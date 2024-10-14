#!/bin/sh

# Check if the argument is provided
if [ -z "$1" ]; then
    echo "Usage: embiggen <archive>"
    exit 1
fi

# Extract the file based on its extension
case "$1" in 
    *.gz)  tar -xvzf "$1" ;;
    *.tar) tar -xvf "$1" ;;
    *.zip) unzip "$1" ;;
    *.rar) unrar x "$1" ;;
    *.7z)  7z x "$1" ;;
    *) echo "embiggen: unknown file type" ;;
esac

