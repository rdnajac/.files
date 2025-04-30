#!/bin/sh
# https://github.com/neovim/neovim/releases

wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-macos-arm64.tar.gz

xattr -c ./nvim-macos-arm64.tar.gz

tar xzvf nvim-macos-arm64.tar.gz

rm -fv ./nvim-macos-arm64.tar.gz

sudo mv nvim-macos-arm64 /opt

# add /opt/nvim-macos-arm64/bin to PATH
