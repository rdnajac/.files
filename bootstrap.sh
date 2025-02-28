#!/usr/bin/env sh
## Symlink all dotfiles

THISDIR=$(realpath "$0")

for dotfile in ./home/.*; do
	if [ "$(basename "$dotfile")" = "." ] || [ "$(basename "$dotfile")" = ".." ]; then
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

# zsh
# IMPORTANT! use double quotes around EOF
cat << EOF > "$HOME/.zshenv"
set -x
export ZDOTDIR=$THISDIR/zsh

if [ -f "$ZDOTDIR/.zshenv" ]; then
    . "${ZDOTDIR}/.zshenv"
fi
EOF

exec "$SHELL"
