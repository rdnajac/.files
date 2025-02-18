#!/usr/bin/env sh
## Symlink all dotfiles to the home directory

for dotfile in ./.*; do
    # Skip . and ..
    if [ "$dotfile" = "./." ] || [ "$dotfile" = "./.." ]; then
        continue
    fi
    ln -sfnv "$(realpath "$dotfile")" "${HOME}/${dotfile}"
done

