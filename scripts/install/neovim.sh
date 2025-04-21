#!/bin/sh
printf "Current Neovim version: %s\n" "$(nvim --version 2>/dev/null | grep 'NVIM v')"
TEMPDIR=$(mktemp -d)
cd "$TEMPDIR" || exit 1
mkdir -p ~/.local/bin

# Create installation directory
set -x
git clone https://github.com/neovim/neovim.git
cd neovim \
	&& make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=~/.local/bin \
	&& make install  # TODO: this is incorrect. build artifacts are placed in the above dir
cd .. && rm -rf "$TEMPDIR"
set +x
printf "Updated Neovim version: %s\n" "$(nvim --version 2>/dev/null | grep 'NVIM v')"
