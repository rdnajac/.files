#!/bin/bash

# Define dotfiles and their target locations using associative array
declare -A dotfiles=([".vimrc"]="~/",
                     ["alacritty.toml"]="~/.config/alacritty/"

                 )

# Iterate over the associative array
for file in "${!dotfiles[@]}"; do
    source="$HOME/.files/$file"
    target="${dotfiles[$file]}$file"
    ln -sfn "$source" "$target" # Create symbolic link with force and no-dereference options
    echo "Linked $source to $target"
done

