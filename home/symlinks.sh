#!/usr/bin/env sh
## Symlink all dotfiles to the home directory

for dotfile in ./.*; do
	if [ "$dotfile" = "./." ] || [ "$dotfile" = "./.." ]; then
		continue # Skip `.` and `..`
	fi
	ln -sfnv "$(realpath "$dotfile")" "${HOME}/${dotfile}"
done
