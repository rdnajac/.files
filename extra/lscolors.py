#!/usr/bin/env python3

import os


def color(code):
    return f"0;{code}"


def bold(code):
    return f"1;{code}"


# Define basic colors
BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE = range(30, 38)

# Define color schemes
ls_colors = {
    "di": bold(BLUE),  # directory
    "ln": bold(YELLOW),  # symbolic link
    "pi": color(YELLOW),  # pipe
    "so": color(YELLOW),  # socket
    "bd": color(YELLOW),  # block device
    "cd": color(YELLOW),  # character device
    "or": bold(RED),  # orphan symlink
    "mi": bold(RED),  # missing file
    "ex": bold(RED),  # executable
    # Archives
    "*.7z": color(RED),
    "*.bz": color(RED),
    "*.bz2": color(RED),
    "*.gz": color(RED),
    "*.rar": color(RED),
    "*.tar": color(RED),
    "*.tgz": color(RED),
    "*.zip": color(RED),
    # Images
    "*.bmp": color(MAGENTA),
    "*.gif": color(MAGENTA),
    "*.jpg": color(MAGENTA),
    "*.jpeg": color(MAGENTA),
    "*.png": color(MAGENTA),
    "*.svg": color(MAGENTA),
    # Audio
    "*.aac": color(CYAN),
    "*.flac": color(CYAN),
    "*.m4a": color(CYAN),
    "*.mp3": color(CYAN),
    "*.ogg": color(CYAN),
    "*.wav": color(CYAN),
    # Video
    "*.avi": color(MAGENTA),
    "*.mkv": color(MAGENTA),
    "*.mp4": color(MAGENTA),
    "*.webm": color(MAGENTA),
    # Documents - yellow; bold if not plain text
    ## Office
    "*.doc": bold(YELLOW),
    "*.docx": bold(YELLOW),
    "*.ppt": bold(YELLOW),
    "*.pptx": color(YELLOW),
    "*.pdf": bold(YELLOW),
    "*.xls": bold(YELLOW),
    "*.xlsx": bold(YELLOW),
    "*.txt": color(YELLOW),
    "*.csv": color(YELLOW),
    "*.tsv": color(YELLOW),
    # config or data files
    "*.json": color(YELLOW),
    "*.xml": color(YELLOW),
    "*.yaml": color(YELLOW),
    "*.yml": color(YELLOW),
    "*.toml": color(YELLOW),
    # Code
    "*.c": color(GREEN),
    "*.cpp": color(GREEN),
    "*.py": color(GREEN),
    "*.js": color(GREEN),
    "*.sh": color(GREEN),
}


def generate_ls_colors():
    return ":".join(f"{k}={v}" for k, v in ls_colors.items())


if __name__ == "__main__":
    print(generate_ls_colors())
