#!/bin/sh
## POSIX-compliant Neovim installation script

# Print current Neovim version
print_nvim_version() {
	prefix="$1"
	printf "%s Neovim version: %s\n" "$prefix" "$(nvim --version 2> /dev/null | grep 'NVIM v' || echo 'not installed')" >&2
}

# Print error message and exit
error() {
	printf "ERROR: %s\n" "$1" >&2
	exit 1
}

# Detect system info and determine download URL
get_download_info() {
	arch="$(uname -m)"
	os="$(uname)"
	url=""
	dirname=""

	if [ "$os" = "Darwin" ]; then
		# macOS
		if [ "$arch" = "x86_64" ]; then
			url="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
			dirname="nvim-macos-x86_64"
		elif [ "$arch" = "arm64" ]; then
			url="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
			dirname="nvim-macos-arm64"
		else
			error "Unsupported macOS architecture: $arch"
		fi
	else
		# Linux or other Unix
		if [ "$arch" = "x86_64" ]; then
			url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz"
			dirname="nvim-linux-x86_64"
		elif [ "$arch" = "arm64" ] || [ "$arch" = "aarch64" ]; then
			url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-arm64.tar.gz"
			dirname="nvim-linux-arm64"
		else
			error "Unsupported architecture: $arch on $os"
		fi
	fi

	echo "$url:$dirname"
}

# Install Neovim
main() {
	print_nvim_version "Current"

	# Begin command tracing
	set -x

	TEMPDIR=$(mktemp -d) || error "Failed to create temporary directory"
	cd "$TEMPDIR" || error "Failed to change to temporary directory"

	# Get download info
	DOWNLOAD_INFO=$(get_download_info)
	URL=$(echo "$DOWNLOAD_INFO" | cut -d':' -f1)
	DIRNAME=$(echo "$DOWNLOAD_INFO" | cut -d':' -f2)
	FILENAME=$(basename "$URL")

	# Download
	curl -LO "$URL" || error "Download failed"

	# Remove quarantine attributes on macOS
	[ "$(uname)" = "Darwin" ] && xattr -c "./$FILENAME" 2> /dev/null

	# Extract
	tar xzf "$FILENAME" || error "Extraction failed"

	# Install
	mkdir -p "$HOME/.local/bin" || error "Failed to create install directory"
	mv -f "$DIRNAME/bin/nvim" "$HOME/.local/bin/" || error "Installation failed"

	# Update PATH if necessary
	if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
		SHELL_RC="$HOME/.$(basename "$SHELL")rc"
		echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
	fi

	# Cleanup
	cd "$HOME" && rm -rf "$TEMPDIR"

	# End command tracing
	set +x

	print_nvim_version "Updated"
}

# Run the script
main
