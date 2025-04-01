# Source any existing aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# alias ls='gls -F --color=auto --group-directories-first'

# Check if command exists
have() { (( $+commands[$1] )) }

have brew && {
	alias brewup='brew update; brew upgrade; brew cleanup -s;'
	alias ctags='$(brew --prefix)/bin/ctags'
}

have micromamba && {
	alias conda='micromamba'
	alias mm='micromamba'
	alias mminstall='micromamba install -c conda-forge -c bioconda'
}

# better versions of things in rust
have bat && alias cat=bat
have eza && {
	alias l='eza --all --tree -l -L3 --group-directories-first --colour=always --icons=auto --git-ignore'
	alias ls='eza --group-directories-first --colour=always --icons=auto'
	alias ll='eza --all -l --group-directories-first --colour=always --icons=auto'
}


unfunction have 
