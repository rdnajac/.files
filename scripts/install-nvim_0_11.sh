#!/bin/bash
# Download nvim-macos-arm64.tar.gz
# Run xattr -c ./nvim-macos-arm64.tar.gz (to avoid "unknown developer" warning)
# Extract: tar xzvf nvim-macos-arm64.tar.gz
# Run ./nvim-macos-arm64/bin/nvim

cd ~/Downloads

xattr -c ./nvim-macos-arm64.tar.gz
tar xzvf nvim-macos-arm64.tar.gz
sudo mv nvim-macos-arm64 /opt
alias nvim='/opt/nvim-macos-arm64/bin/nvim'
