brewup() {
	brew update && brew upgrade && brew cleanup -s
	if command -v chezmoi >/dev/null 2>&1; then
		brew bundle dump --file="$(chezmoi source-path)/dot_config/brewfile/Brewfile" --force
	fi
	# ~/bin/scripts/install-nvim-nightly.sh
}

# override macOS tools with Homebrew versions
# TODO: only if on macOS?
alias awk="${HOMEBREW_PREFIX}/bin/gawk"

# if the names are the same, rely on the `$PATH` order
# alias ctags="${HOMEBREW_PREFIX}/bin/ctags"
