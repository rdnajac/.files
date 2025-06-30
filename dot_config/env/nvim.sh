export MANPAGER="nvim +Man!"
export NVIM_SOCK="${XDG_RUNTIME_DIR:-$HOME/.cache}/nvim/server.pipe"

alias lv='NVIM_APPNAME=lazyvim nvim'
alias repro='NVIM_APPNAME=repro nvim'
alias zzz='nvim -c "lua Snacks.lazygit()"'

nv() {
	if [ -S "$NVIM_SOCK" ]; then
		resolve_path() {
			realpath "$1" 2>/dev/null || readlink -f "$1" 2>/dev/null
		}

		resolved_args=()
		for arg in "$@"; do
			resolved_path=$(resolve_path "$arg") || {
				echo "warning: '$arg' skipped, parent dir missing" >&2
				continue
			}
			resolved_args+=("$resolved_path")
		done

		nvim --server "$NVIM_SOCK" --remote "${resolved_args[@]}"
	else
		nvim --listen "$NVIM_SOCK" "$@"
	fi
}

# send 
nvr() {
	nvim --headless --noplugin --server "$NVIM_SOCK" --remote-expr "$1"
}

pynvim-remote-eval() {
	python3 - "$@" <<EOF
import sys
from pynvim import attach

if len(sys.argv) < 2:
    print("Usage: nv-remote-eval 'expression'")
    sys.exit(1)

SOCKET = "${NVIM_SOCK}"
EXPR = sys.argv[1]

try:
    nvim = attach('socket', path=SOCKET)
    result = nvim.eval(EXPR)
    print(result)
except Exception as e:
    print(f'Error: {e}', file=sys.stderr)
    sys.exit(1)
EOF
}
