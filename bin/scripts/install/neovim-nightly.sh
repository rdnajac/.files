#!/bin/bash

set -e

# Variables
URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
TAR_NAME="nvim-macos-arm64.tar.gz"
INSTALL_DIR="$HOME/.local/nvim-nightly"
BIN_PATH="/usr/local/bin/nvim"

# Functions
get_version() {
	"$1" --version | awk 'NR==1 { print $2 }'
}

# Execution
echo "👾 Installing Neovim nightly (ARM64)..."

CURRENT_VERSION=$(command -v nvim >/dev/null && get_version nvim || echo "none")
echo "Current Neovim version: $CURRENT_VERSION"

echo "Downloading Neovim nightly..."
curl -L "$URL" -o "$TAR_NAME"

echo "Removing quarantine attribute..."
xattr -c "$TAR_NAME"

echo "Extracting..."
mkdir -p "$INSTALL_DIR"
tar -xzf "$TAR_NAME" -C "$INSTALL_DIR" --strip-components=1

echo "Installing Neovim..."
sudo ln -sf "$INSTALL_DIR/bin/nvim" "$BIN_PATH"

echo "Cleaning up..."
rm "$TAR_NAME"

NEW_VERSION=$(get_version nvim)
echo "✅ Neovim nightly (ARM64) installed successfully!"
echo "New Neovim version: $NEW_VERSION"
