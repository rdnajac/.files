#!/bin/bash
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && git rev-parse --show-toplevel)"
echo "$REPO_ROOT"

# Create a symlink in the home directory
# Arguments: $1 - dotfile name (e.g. tmux.conf)
make_symlink() {
	local dest="${HOME}/.${1}"
	if [ -e "$dest" ]; then
		echo "found .$1 in home directory"
		if [ ! -L "$dest" ]; then
			echo "moving .$1 to .$1.old"
			mv -iv "$dest" "$dest.old"
		fi
	fi
	echo "linking $1..."
	ln -sfv "$REPO_ROOT/$1" "$dest"
}

make_symlink bash_aliases
make_symlink tmux.conf
make_symlink alacritty.toml

# Prompt to clone vim config
read -p "Do you want to clone vim config? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	# (cd ~ && git clone --recurse-submodules)
fi

# [[ command zsh > /dev/null ]] && make_symlink zshrc
if [ "$(uname)" = "Darwin" ]; then
	make_symlink zshrc
fi

exec "$SHELL"
