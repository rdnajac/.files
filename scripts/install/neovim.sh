#!/bin/sh
set -x

TEMPDIR=$(mktemp -d)
cd "$TEMPDIR" || exit 1
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
xattr -c ./nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
mv nvim-macos-arm64/bin/nvim ~/.local/bin
cd .. && rm -rf $TEMPDIR
