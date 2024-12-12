#!/usr/bin/env sh
set -eu

# Get the root of the repository
REPO_ROOT="$(cd "$(dirname "$0")" && git rev-parse --show-toplevel)"

echo "Repository Root: $REPO_ROOT"

# Move existing files to backups if not symlinks
backup_if_exists() {
	if [ -e "$1" ] && [ ! -L "$1" ]; then
		mv -iv "$1" "$1.old"
	fi
}

# Create a symlink in the home directory
make_symlink() {
	dest="${HOME}/.$1"
	backup_if_exists "$dest"
	ln -sfv "$REPO_ROOT/$1" "$dest"
}

dotfiles="alacritty.toml bash_aliases gitconfig tmux.conf condarc"

for dotfile in $dotfiles; do
	make_symlink "$dotfile"
done

# Symlink zshrc if on macOS
if [ "$(uname)" = "Darwin" ]; then
	make_symlink "zshrc"
fi

# Prompt the user for additional actions
prompt_user() {
	printf "%s [y/n]: " "$1"
	read -r reply
	case "$reply" in
	[yY]) return 0 ;;
	*) return 1 ;;
	esac
}

# Clone vim config if requested
if prompt_user "Do you want to clone the vim config?"; then
	backup_if_exists "$HOME/.vim"

	echo "Cloning vim config..."
	git clone --recurse-submodules https://github.com/rdnajac/.vim.git "$HOME/.vim"
fi

# Restart shell
exec "$SHELL"
