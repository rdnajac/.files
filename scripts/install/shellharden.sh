#!/bin/sh
TEMPDIR=$(mktemp -d)
git clone https://github.com/anordal/shellharden "$TEMPDIR"
cd "$TEMPDIR" || exit 1
# TODO: install shellharden

