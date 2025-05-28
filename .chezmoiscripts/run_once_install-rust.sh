#!/bin/sh
## Install rust using rustup if it is not already installed.
if ! command -v cargo > /dev/null; then
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  . "$HOME/.cargo/env"
fi
