#!/usr/bin/env sh

# Get the root of the repository
REPO_ROOT="$(cd "$(dirname "$0")" && git rev-parse --show-toplevel)"
echo "Repository Root: $REPO_ROOT"

# Create a symlink in the home directory
# Arguments: $1 - dotfile name (e.g. tmux.conf)
make_symlink() {
	if [ "$1" = "" ]; then
		echo "Error: No filename provided."
		return 1
	fi

	dest="${HOME}/.$1"
	if [ -e "$dest" ]; then
		echo "Found .$1 in home directory."
		if [ ! -L "$dest" ]; then
			echo "Moving .$1 to .$1.old"
			mv -iv "$dest" "$dest.old"
		fi
	fi
	echo "Linking $1..."
	ln -sfv "$REPO_ROOT/$1" "$dest"
}

make_symlink "alacritty.toml"
make_symlink "bash_aliases"
make_symlink "gitconfig"
make_symlink "tmux.conf"

# Symlink zshrc if on macOS
if [ "$(uname)" = "Darwin" ]; then
	make_symlink "zshrc"
fi

if prompt_user "Do you want to clone vim config?"; then
	# Uncomment and specify the desired git repository
	# git clone --recurse-submodules <vim_repo_url> ~/.vim
	echo "Cloning vim config..."
fi

exec "$SHELL"
