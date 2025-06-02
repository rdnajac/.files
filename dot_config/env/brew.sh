brewup() {
	brew update && brew upgrade && brew cleanup -s
	if command -v chezmoi > /dev/null 2>&1; then
		brew bundle dump --file="$(chezmoi source-path)/dot_config/brewfile/Brewfile" --force
	fi
	~/bin/scripts/install-nvim-nightly.sh
}

# override macOS tools with Homebrew versions
alias awk="${HOMEBREW_PREFIX}/bin/gawk"
alias ctags="${HOMEBREW_PREFIX}/bin/ctags"
