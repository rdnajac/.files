if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

alias brewup='brew update; brew upgrade; brew cleanup -s;'
alias ls='gls -F --color=auto --group-directories-first'
alias ctags='$(brew --prefix)/bin/ctags'
alias conda='micromamba'
alias mm='micromamba'
alias mminstall='micromamba install -c conda-forge -c bioconda'
# alias repro='nvim -u ~/GitHub/repro.lua'

# quickly edit config files
alias   ba='${EDITOR:-vim} $HOME/.bash_aliases'
alias  tmx='${EDITOR:-vim} $HOME/.tmux.conf'
alias alac='${EDITOR:-vim} $HOME/.alacritty.toml'
alias   zr='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'
alias   nn='${EDITOR:-vim} ${DOTDIR}/etc/nnn.sh'

# better versions of things in rust
alias cat=bat
alias ls=eza
