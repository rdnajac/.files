# POSIX-compliant helper functions
info() {
	printf "\033[33m%s\033[0m\n" "$*" >&2
}

error() {
	printf "\033[31m%s\033[0m\n" "$*" >&2
}

cd_or_die() {
	cd "$1" || {
		error "cd: cannot enter directory: $1"
		exit 1
	}
}

fail_helper() {
	local message="$1"
	echo "$message" >&2
	FAIL="true"
}

exit_value_helper() {
	if [ "$FAIL" == "true" ]; then
		exit 1
	else
		exit 0
	fi
}
