#!/bin/bash

# Usage message
usage() {
  echo "Usage: $0 <source> [destination]"
  echo "source: The file or folder to symlink."
  echo "destination: Optional. The target directory for the symlink. Defaults to the home directory."
}

# Check if a source is provided
if [ -z "$1" ]; then
  usage
  exit 1
fi

# Source and destination variables
source_path="$1"
destination_path="${2:-$HOME}"

# Ensure the source exists
if [ ! -e "$source_path" ]; then
  echo "Source not found: $source_path"
  exit 1
fi

# Compute the absolute path of the source
abs_source_path="$(realpath "$source_path")"

# Determine the name of the source item (file or folder)
source_name=$(basename "$source_path")

# Create the symlink in the destination directory
ln -s "$abs_source_path" "$destination_path/$source_name"

echo "Symlink created: $destination_path/$source_name"

