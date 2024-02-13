#!/bin/bash

dotfiles=(
    "alacritty.toml"
    ".vimrc"
    ".tmux.conf"
    ".gitconfig"
    "config.yaml" # clangd
)

locations=(
    "$HOME/.config/alacritty/"
    "$HOME/"
    "$HOME/"
    "$HOME/"
    "$HOME/.config/clangd/"
)

# Loop through the arrays
for i in "${!dotfiles[@]}"; do
    file="${dotfiles[i]}"
    target_location="${locations[i]}"

    # Source files are located under $HOME/.files
    source="$HOME/.files/${file}"
    target="${target_location}${file}"

    # Create a symbolic link
    ln -sfn "$source" "$target"
    echo "Linked $source to $target"
done

