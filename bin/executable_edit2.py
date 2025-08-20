#!/usr/bin/env python3

import os
import sys
import subprocess
from pathlib import Path
import shlex
import argparse

NVIM_SOCK = os.environ.get('NVIM_SOCK',
                          os.path.join(os.environ.get('XDG_RUNTIME_DIR', '/tmp'), 'nvim', 'server.pipe'))
TMUX_PANE_NAME = os.environ.get('TMUX_PANE_NAME', 'nvim_visual')
NNN_SPLITSIZE = os.environ.get('NNN_SPLITSIZE', '80')

def resolve_path(path):
    p = Path(path)
    try:
        return str(p.resolve(strict=True))
    except FileNotFoundError:
        return str(p.absolute())

def rm_pipe():
    sock_path = Path(NVIM_SOCK)
    if sock_path.is_socket():
        try:
            sock_path.unlink()
            print(f"Removed socket {NVIM_SOCK}")
        except Exception as e:
            print(f"Failed to remove socket: {e}", file=sys.stderr)

def run_nvim(args):
    if args:
        os.execvp('nvim', ['nvim'] + args)
    else:
        os.execvp('nvim', ['nvim'])

def main():
    parser = argparse.ArgumentParser(
        description="Launch or connect to nvim with socket and tmux integration."
    )
    parser.add_argument('-f', '--force-plain', action='store_true',
                        help='Force plain nvim (skip socket)')
    parser.add_argument('-t', '--tmux-split', action='store_true',
                        help='Open in tmux split if no socket')
    parser.add_argument('-d', '--delete-socket', action='store_true',
                        help='Delete socket pipe and exit')
    parser.add_argument('nvim_args', nargs=argparse.REMAINDER,
                        help='Flags and files for nvim')

    args = parser.parse_args()

    if args.delete_socket:
        rm_pipe()
        sys.exit(0)

    resolved_args = []
    for a in args.nvim_args:
        if a.startswith('-'):
            resolved_args.append(a)
        else:
            resolved_args.append(resolve_path(a))

    if not args.force_plain:
        sock_path = Path(NVIM_SOCK)
        if sock_path.exists() and sock_path.is_socket():
            run_nvim(['--server', NVIM_SOCK, '--remote'] + resolved_args)
        else:
            run_nvim(['--listen', NVIM_SOCK] + resolved_args)

    if os.environ.get('NVIM'):
        sys.exit(0)

    if args.tmux_split and 'TMUX' in os.environ:
        tmux_cmd = ['tmux', 'split-window', '-h', '-p', NNN_SPLITSIZE]
        if resolved_args:
            nvim_cmd = 'nvim ' + ' '.join(shlex.quote(a) for a in resolved_args)
        else:
            nvim_cmd = 'nvim'
        tmux_cmd.append(nvim_cmd)
        subprocess.run(tmux_cmd, check=True)
        subprocess.run(['tmux', 'select-pane', '-T', TMUX_PANE_NAME], check=True)
        sys.exit(0)

    run_nvim(resolved_args)

if __name__ == '__main__':
    main()
