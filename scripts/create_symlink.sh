#!/bin/bash

# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename=$1

# Check if the file exists in the ./files directory
if [ ! -e "${filename}" ]; then
  echo "File not found: ${filename}"
  exit 1
fi

# Create the symlink
ln -s -n "${filename}" ~/

echo "Symlink created: ~/${filename}"

