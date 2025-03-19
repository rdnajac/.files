#!/bin/sh
printf "Current Neovim version: %s\n" "$(nvim --version 2>/dev/null | grep 'NVIM v')"
set -x
TEMPDIR=$(mktemp -d)
cd "$TEMPDIR" || exit 1

# Create installation directory
mkdir -p ~/.local/bin

# Determine OS and architecture
OS="$(uname)"
ARCH="$(uname -m)"

if [ "$OS" = "Darwin" ]; then
  # macOS download and install
  FILENAME="nvim-macos-$ARCH.tar.gz"
  curl -LO "https://github.com/neovim/neovim/releases/download/nightly/$FILENAME"
  xattr -c "./$FILENAME"
  tar xzf "$FILENAME"
  mv -f "nvim-macos-$ARCH/bin/nvim" ~/.local/bin
else
  # Linux download and install
  # Convert arm64 to aarch64 if needed for filename consistency
  [ "$ARCH" = "arm64" ] && ARCH="aarch64"
  FILENAME="nvim-linux-$ARCH.appimage"
  curl -LO "https://github.com/neovim/neovim/releases/download/nightly/$FILENAME"
  chmod u+x "$FILENAME"
  mv -f "$FILENAME" ~/.local/bin/nvim
fi

cd - && rm -rf "$TEMPDIR"
set +x
printf "Updated Neovim version: %s\n" "$(nvim --version 2>/dev/null | grep 'NVIM v')"
