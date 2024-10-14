#!/usr/bin/env python3

import os


def color(code):
    return f"0;{code}"


def bold(code):
    return f"1;{code}"


# Define basic colors
BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE = range(30, 38)

# Define color schemes and icons
file_attributes = {
    "di": {"color": bold(BLUE), "icon": "📁"},  # directory
    "ln": {"color": bold(YELLOW), "icon": "🔗"},  # symbolic link
    "pi": {"color": color(YELLOW), "icon": "📊"},  # pipe
    "so": {"color": color(YELLOW), "icon": "🔌"},  # socket
    "bd": {"color": color(YELLOW), "icon": "💽"},  # block device
    "cd": {"color": color(YELLOW), "icon": "📀"},  # character device
    "or": {"color": bold(RED), "icon": "❓"},  # orphan symlink
    "mi": {"color": bold(RED), "icon": "❓"},  # missing file
    "ex": {"color": bold(RED), "icon": "🚀"},  # executable
    # Archives
    "*.7z": {"color": color(RED), "icon": "🗜️"},
    "*.bz": {"color": color(RED), "icon": "🗜️"},
    "*.bz2": {"color": color(RED), "icon": "🗜️"},
    "*.gz": {"color": color(RED), "icon": "🗜️"},
    "*.rar": {"color": color(RED), "icon": "🗜️"},
    "*.tar": {"color": color(RED), "icon": "🗜️"},
    "*.tgz": {"color": color(RED), "icon": "🗜️"},
    "*.zip": {"color": color(RED), "icon": "🗜️"},
    # Images
    "*.bmp": {"color": color(MAGENTA), "icon": "🖼️"},
    "*.gif": {"color": color(MAGENTA), "icon": "🖼️"},
    "*.jpg": {"color": color(MAGENTA), "icon": "🖼️"},
    "*.jpeg": {"color": color(MAGENTA), "icon": "🖼️"},
    "*.png": {"color": color(MAGENTA), "icon": "🖼️"},
    "*.svg": {"color": color(MAGENTA), "icon": "🖼️"},
    # Audio
    "*.aac": {"color": color(CYAN), "icon": "🎵"},
    "*.flac": {"color": color(CYAN), "icon": "🎵"},
    "*.m4a": {"color": color(CYAN), "icon": "🎵"},
    "*.mp3": {"color": color(CYAN), "icon": "🎵"},
    "*.ogg": {"color": color(CYAN), "icon": "🎵"},
    "*.wav": {"color": color(CYAN), "icon": "🎵"},
    # Video
    "*.avi": {"color": color(MAGENTA), "icon": "🎬"},
    "*.mkv": {"color": color(MAGENTA), "icon": "🎬"},
    "*.mp4": {"color": color(MAGENTA), "icon": "🎬"},
    "*.webm": {"color": color(MAGENTA), "icon": "🎬"},
    # Documents
    "*.doc": {"color": color(YELLOW), "icon": "📄"},
    "*.docx": {"color": color(YELLOW), "icon": "📄"},
    "*.pdf": {"color": color(YELLOW), "icon": "📕"},
    "*.txt": {"color": color(YELLOW), "icon": "📝"},
    # Code
    "*.c": {"color": color(GREEN), "icon": "💻"},
    "*.cpp": {"color": color(GREEN), "icon": "💻"},
    "*.py": {"color": color(GREEN), "icon": "🐍"},
    "*.js": {"color": color(GREEN), "icon": "☕"},
    "*.java": {"color": color(GREEN), "icon": "☕"},
    "*.sh": {"color": color(GREEN), "icon": "🐚"},
}


def generate_ls_colors():
    return ":".join(f"{k}={v['color']}" for k, v in file_attributes.items())


def generate_file_icons():
    return " ".join(f"{k}={v['icon']}" for k, v in file_attributes.items())


if __name__ == "__main__":
    print(f"LS_COLORS='{generate_ls_colors()}'")
    print(f"FILE_ICONS='{generate_file_icons()}'")
