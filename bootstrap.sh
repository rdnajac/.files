#!/usr/bin/env sh
## Symlink all dotfiles
set -eu

THISDIR=$(dirname "$(realpath "$0")")

# ln -sfnv "${THISDIR}/home/.Rprofile" "${HOME}/.Rprofile"
ln -sfnv "${THISDIR}/home/.bash_aliases" "${HOME}/.bash_aliases"

for confdir in ./config/*; do
	ln -sfnv "$(realpath "$confdir")" "${XDG_CONFIG_HOME:-$HOME/.config}/$(basename "$confdir")"
done

for binfile in ./bin/*; do
	ln -sfnv "$(realpath "$binfile")" "${HOME}/.local/bin/$(basename "$binfile")"
done

# IMPORTANT! use double quotes around EOF so that $THISDIR expands
# IMPORTANT! prepend the `$` with a `\` so it does not 
cat << EOF > "$HOME/.zshenv"
export DOTDIR=$THISDIR
export ZDOTDIR=\${XDG_CONFIG_HOME:-\$HOME/.config}/zsh

if [ -f "\${ZDOTDIR}/.zshenv" ]; then
    . "\${ZDOTDIR}/.zshenv"
fi
EOF

exec "$SHELL"
