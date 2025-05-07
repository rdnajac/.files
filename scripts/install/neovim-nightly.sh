#!/bin/bash

set -e

# Variables
URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
TAR_NAME="nvim-macos-arm64.tar.gz"
INSTALL_DIR="$HOME/.local/nvim-nightly"
BIN_PATH="/usr/local/bin/nvim"

# Step 1: Download
echo "Downloading Neovim nightly..."
curl -L "$URL" -o "$TAR_NAME"

# Step 2: Remove quarantine attribute
echo "Removing quarantine attribute..."
xattr -c "$TAR_NAME"

# Step 3: Extract
echo "Extracting..."
mkdir -p "$INSTALL_DIR"
tar -xzf "$TAR_NAME" -C "$INSTALL_DIR" --strip-components=1

# Step 4: Symlink to /usr/local/bin
echo "Installing Neovim..."
sudo ln -sf "$INSTALL_DIR/bin/nvim" "$BIN_PATH"

# Step 5: Cleanup
echo "Cleaning up..."
rm "$TAR_NAME"

echo "✅ Neovim nightly (ARM64) installed successfully!"
nvim --version
