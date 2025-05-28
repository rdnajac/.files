# POSIX-compliant helper functions
# TODO: keep global variables here?

# ENV_VAR_NAME="RDN_ENV"

DOTDIR="$HOME/.files"

info() {
	printf "\033[33m%s\033[0m\n" "$*" >&2
}

error() {
	printf "\033[31m%s\033[0m\n" "$*" >&2
}

shallow_clone() {
	if [ $# -ne 1 ]; then
		error "usage: shallow_clone <repo-url>"
		return 1
	fi
	info "Cloning $1 with depth=1..."
	git clone --depth 1 "$1"
}

cd_or_die() {
	cd "$1" || {
		error "cd: cannot enter directory: $1"
		exit 1
	}
}

ensure_tpm_path_exists() {
	mkdir -p "$(tpm_path)"
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
