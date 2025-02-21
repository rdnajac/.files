#!/usr/bin/env sh
## Symlink all dotfiles

for dotfile in ./home/.*; do
	if [ "$dotfile" = "./." ] || [ "$dotfile" = "./.." ]; then
		continue # Skip `.` and `..`
	fi
	ln -sfnv "$(realpath "$dotfile")" "${HOME}/${dotfile}"
done

for confdir in ./config/*; do
	ln -sfnv "$(realpath "$confdir")" "${XDG_CONFIG_HOME:-$HOME/.config}/$(basename "$confdir")"
done
