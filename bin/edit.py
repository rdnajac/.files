#!/usr/bin/env python3

import sys
import os
import glob
import stat
import shlex
import subprocess
import argparse
import pynvim


def is_socket(path):
    try:
        st = os.stat(path)
        return stat.S_ISSOCK(st.st_mode)
    except OSError:
        return False


def resolve_path(p):
    # mirror the shell realpath/readlink fallback
    try:
        return os.path.realpath(p)
    except Exception:
        return os.path.join(os.getcwd(), p)


def main():
    # --- ENV & defaults ---
    NVIM_SOCK = os.environ.get(
        "NVIM_SOCK",
        os.path.join(
            os.environ.get("XDG_RUNTIME_DIR", os.path.expanduser("~/.cache")),
            "nvim/server.pipe",
        ),
    )
    TMUX_PANE_NAME = os.environ.get("TMUX_PANE_NAME", "nvim_visual")
    NNN_SPLITSIZE = os.environ.get("NNN_SPLITSIZE", "80")
    INSIDE_NNVIM = bool(os.environ.get("NVIM"))
    INSIDE_TMUX = bool(os.environ.get("TMUX"))
    IN_NNN = bool(os.environ.get("NNNLVL"))

    # --- parse only our wrapper flags, leave the rest for nvim ---
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument(
        "-f",
        action="store_true",
        dest="skip_socket",
        help="skip socket; always spawn a new nvim",
    )
    parser.add_argument(
        "-t",
        action="store_true",
        dest="tmux_if_no_socket",
        help="if socket missing (or in NNN), open in a tmux split",
    )
    # stop at the first unknown flag (`--` or any other nvim flag)
    wrapper_args, rest = parser.parse_known_args()

    # if user wrote `--`, strip it off so rest=[] is meaningful
    if rest and rest[0] == "--":
        rest = rest[1:]

    # default to all files if nobody passed any file/flag
    if not rest:
        rest = glob.glob("*")

    # split rest into nvim_flags (start with '-' or '+') vs file paths
    nvim_flags = []
    files = []
    for tok in rest:
        if tok.startswith("-") or tok.startswith("+"):
            nvim_flags.append(tok)
        else:
            files.append(tok)

    # if no actual files, default again to glob
    if not files:
        files = glob.glob("*")

    # rebuild the final nvim argument list
    nvim_args = nvim_flags + [resolve_path(f) for f in files]

    # --- decision tree ---

    # 1) If -f was given OR any nvim_flags are present, bypass socket entirely
    if wrapper_args.skip_socket or nvim_flags:
        os.execvp("nvim", ["nvim", *nvim_args])

    # 2) If a live socket exists, attach & open via RPC
    if is_socket(NVIM_SOCK):
        nvim = pynvim.attach("socket", path=NVIM_SOCK)
        for f in files:
            # you could choose :edit, :tabedit, etc.
            nvim.command(f"edit {shlex.quote(resolve_path(f))}")
        sys.exit(0)

    # 3) If we’re _inside_ another Neovim and no socket → do nothing
    if INSIDE_NNVIM:
        sys.exit(0)

    # 4) Treat NNNLVL as implicit `-t`
    if IN_NNN:
        wrapper_args.tmux_if_no_socket = True

    # 5) If in tmux & `-t`, open a split
    if INSIDE_TMUX and wrapper_args.tmux_if_no_socket:
        cmd = [
            "tmux",
            "split-window",
            "-h",
            "-p",
            NNN_SPLITSIZE,
            "nvim " + " ".join(shlex.quote(a) for a in nvim_args),
        ]
        subprocess.run(cmd, check=True)
        subprocess.run(["tmux", "select-pane", "-T", TMUX_PANE_NAME], check=True)
        sys.exit(0)

    # 6) Fallback: spawn a fresh nvim
    os.execvp("nvim", ["nvim", *nvim_args])


if __name__ == "__main__":
    main()
