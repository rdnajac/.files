#!/bin/bash

files=(
  ".gitconfig" 
  ".tmux.conf")

destination_dir="$HOME"

for file in "${files[@]}"; do
    ln -sf "$file" ~/"$file"
    echo "Created symlink: ~/$file -> $file"
done


mkdir -p ~/.vim
ln -sf .vimrc ~/.vim/.vimrc


# Check if Alacritty is installed
if command -v alacritty &>/dev/null; then
    echo "Alacritty is installed."

    # Create the Alacritty configuration directory if it doesn't exist
    alacritty_config_dir="$HOME/.config/alacritty"
    mkdir -p "$alacritty_config_dir"
    echo "Created directory: $alacritty_config_dir"

    # Symlink ./alacritty.yml to ~/.config/alacritty/alacritty.yml
    symlink_path="$alacritty_config_dir/alacritty.yml"
    if [ -e "$symlink_path" ]; then
        echo "Symlink '$symlink_path' already exists. Skipping."
    else
        ln -sn "$(pwd)/alacritty.yml" "$symlink_path"
        echo "Created symlink: $symlink_path -> $(pwd)/alacritty.yml"
    fi
else
    echo "Alacritty is not installed. Please install Alacritty first."
fi
