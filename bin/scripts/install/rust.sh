#!/bin/sh

# make sure we have cargo (POSIX compliant)
if ! command -v cargo > /dev/null; then
	echo "cargo is not installed"
	# prompt to install rustup
	echo "Would you like to install rustup?"
	read -r -p "Y/n: " response
	if [ "$response" = "n" ]; then
		exit 1
	fi
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# echo "sourcing cargo env..."
# . "$HOME/.cargo/env"
# echo "you can make sure this is run every time you open a shell with:"
# echo "    echo '. $HOME/.cargo/env' >> ~/.bashrc"

cargo install shellharden pokeget fd-find ripgrep bat eza zoxide
