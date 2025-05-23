# .zshrc - my zsh configuration

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

setopt interactivecomments

for f in $ZDOTDIR/*.zsh; do
	. "$f"
done

have() { (( $+commands[$1] )) }

have brew && {
	alias brewup='brew update; brew upgrade; brew cleanup -s;'
	alias ctags='$(brew --prefix)/bin/ctags'
	alias awk='$(brew --prefix)/bin/gawk'
}

have micromamba && {
	alias conda='micromamba'
	alias mm='micromamba'
	alias mminstall='micromamba install -c conda-forge -c bioconda'
}

# have bat && alias cat=bat
have eza && {
	alias l='eza --all --tree -l -L3 --group-directories-first --colour=always --icons=auto --git-ignore'
	# alias ls='eza --group-directories-first --colour=always --icons=auto'
	alias ll='eza --all -l --group-directories-first --colour=always --icons=auto'
}

# Source custom zsh configs

# Source shell configs for specific programs
have nnn && . $DOTDIR/etc/nnn.sh
have fzf && . $DOTDIR/etc/fzf.sh
have nvim && . $DOTDIR/etc/neovim.sh
have aws && . $DOTDIR/etc/aws.zsh

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

export MAMBA_EXE="$HOME/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="$HOME/.cache/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup

have zoxide && {
	eval "$(zoxide init zsh)"
	eval "${$(zoxide init zsh):s#_files -/#_cd#}"
	alias cd=z
	alias zx='zoxide remove "$PWD" && echo "Removed $PWD from zoxide database."'
}

unfunction have 

micromamba activate cbmf
eval "$(register-python-argcomplete cbmf)"

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."

. "$HOME/.local/share/../bin/env"
