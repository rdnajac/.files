#!/bin/bash
#
# Symlink all dotfiles and `XDG_CONFIG_DIR`s
set -eu
IFS=$'\n\t'

die() {
	printf 'fatal: %s\n' "$1" >&2
	exit 1
}

link() {
	[[ $# -ne 2 ]] && die "usage: link <src> <dst>"
	local src=$1 dst=$2
	[[ ! -e $src ]] && die "$src does not exist"
	ln -sfnv "$src" "$dst"
}

readonly THISDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME"

link "$THISDIR/home/.Rprofile" "$HOME/.Rprofile"
link "$THISDIR/home/.bash_aliases" "$HOME/.bash_aliases"

for src in "$THISDIR"/config/*; do
	[[ -d $src ]] || continue
	link "$src" "$XDG_CONFIG_HOME/$(basename "$src")"
done

# IMPORTANT! $ will expand only if EOF is unquoted or double-quoted
# IMPORTANT! prepend the `$` with a `\` so it does not expand
cat << EOF > "$HOME/.zshenv"
export DOTDIR=$THISDIR
export ZDOTDIR=\${XDG_CONFIG_HOME:-\$HOME/.config}/zsh

if [ -f "\${ZDOTDIR}/.zshenv" ]; then
    . "\${ZDOTDIR}/.zshenv"
fi
EOF

exec zsh --login
