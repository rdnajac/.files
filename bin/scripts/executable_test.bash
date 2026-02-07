#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$CURRENT_DIR/scripts"
PROGRAM_NAME="$0"

# TODO: fix usage
if [ "$1" = '-h' ]; then
	echo "usage:"
	echo "  $PROGRAM_NAME all                   update all plugins"
	echo "  $PROGRAM_NAME tmux-foo              update plugin 'tmux-foo'"
	echo "  $PROGRAM_NAME tmux-bar tmux-baz     update multiple plugins"
	exit 1
fi

main() {
	"$SCRIPTS_DIR/test.sh"
}

main "$@"
