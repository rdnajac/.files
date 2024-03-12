#!/bin/bash
# Name of the folder in ~/.files you want to symlink
folder_name=".vim"
# Create symlink in home directory
ln -s "$HOME/.files/$folder_name" "$HOME/$folder_name"

