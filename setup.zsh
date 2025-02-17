#!/bin/zsh
# setup.zsh
set -eu
THISDIR="$(cd "$(dirname "$0")" && git rev-parse --show-toplevel)"

for dotfile in condarc gitconfig zshrc alacritty.toml tmux.conf; do
  ln -sfnv $(realpath ${THISDIR})/${dotfile} $HOME/.${dotfile};
done
