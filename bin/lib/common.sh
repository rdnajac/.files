#!/bin/sh
# POSIX-compliant helper functions

# prints yellow message to stderr
info() {
	printf "\033[33m%s\033[0m\n" "$*" >&2
}

# prints red message to stderr
error() {
	printf "\033[31m%s\033[0m\n" "$*" >&2
}

# prints green message to stderr
success() {
	printf "\033[32m%s\033[0m\n" "$*" >&2
}

yay() {
	printf "%s%s%s%s%s%s%s%s%s\n" \
		"🌈" \
		"$(printf '\033[1;31mS\033[0m')" \
		"$(printf '\033[1;33mu\033[0m')" \
		"$(printf '\033[1;32mc\033[0m')" \
		"$(printf '\033[1;36mc\033[0m')" \
		"$(printf '\033[1;34me\033[0m')" \
		"$(printf '\033[1;35ms\033[0m')" \
		"$(printf '\033[1;31ms\033[0m')" \
		"! 🎉✨🍾"
}

# @param $1 Error message (wrapped in quotes!)
# @param $2 Exit code (optional, defaults to 1)
die() {
	error "$1" && exit "${2:-1}"
}

cd_or_die() {
	cd "$1" || die "Failed to change directory to '$1'"
}

# Convert a file into a Bash array of lines
file_to_array() {
	local file="$1"
	local lines=()
	local line
	while IFS= read -r line; do
		lines+=("$line")
	done < "$file" || return 1
	# Now `lines` is the array
	# To print or use:
	printf '%s\n' "${lines[@]}"
}
