#!/usr/bin/env sh
## Symlink all dotfiles

for dotfile in ./home/.*; do
	if [ "$dotfile" = "./." ] || [ "$dotfile" = "./.." ]; then
		continue
	fi
	ln -sfnv "$(realpath "$dotfile")" "${HOME}/$(basename "$dotfile")"
done

for confdir in ./config/*; do
	ln -sfnv "$(realpath "$confdir")" "${XDG_CONFIG_HOME:-$HOME/.config}/$(basename "$confdir")"
done

for binfile in ./bin/*; do
	ln -sfnv "$(realpath "$binfile")" "${HOME}/.local/bin/$(basename "$binfile")"
	# cp -fvr "$(realpath "$binfile")" "${HOME}/.local/bin/$(basename "$binfile")"
done
