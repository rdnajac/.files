if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

alias brewup='brew update; brew upgrade; brew cleanup -s;'
# alias ls='gls -F --color=auto --group-directories-first'
alias ctags='$(brew --prefix)/bin/ctags'
alias conda='micromamba'
alias mm='micromamba'
alias mminstall='micromamba install -c conda-forge -c bioconda'
alias nvserver='nvim --listen ~/.cache/nvim/server.pipe'

# alias repro='nvim -u ~/GitHub/repro.lua'

# quickly edit config files
alias   ba='nvim $HOME/.bash_aliases'
alias  tmx='nvim $HOME/.config/tmux/tmux.conf'
alias alac='nvim $HOME/.alacritty.toml'
alias   zr='nvim ${ZDOTDIR:-$HOME/.zsh}'
alias   nn='nvim ${DOTDIR}/etc/nnn.sh'

# better versions of things in rust
alias cat=bat
alias l='eza --all --tree -l -L3 --group-directories-first --colour=always --icons=auto --git-ignore'
alias ls='eza --group-directories-first --colour=always --icons=auto'
alias ll='eza --all -l --group-directories-first --colour=always --icons=auto'

alias lazy='nvim -c "lua Snacks.lazygit()"'
