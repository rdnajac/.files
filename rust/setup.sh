#!/bin/sh

# make sure we have cargo (POSIX compliant)
if ! command -v cargo > /dev/null; then
    echo "cargo is not installed"
    exit 1
fi

cargo install shellharden
