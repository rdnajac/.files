#!/bin/bash

extensions=(
	"dlvhdr/gh-dash"
	"github/gh-copilot"
)

if command -v gh &> /dev/null; then
	for extension in "${extensions[@]}"; do
		gh extension install "$extension" --force
	done
fi
