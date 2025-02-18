# .zshrc - my custom zsh configuration

# initialization {{{
setopt interactivecomments # Don't error on `#` in command line

# aliases {{{

# THISDIR=$(cd "$(dirname "$0")" && pwd)
# THISDIR="$(cd "$(dirname "$0")" && git rev-parse --show-toplevel)"
THISDIR="SCRIPT_DIR="$(dirname "$(readlink -f "$0")")""


export LS_COLORS="$(/Users/rdn/Desktop/GitHub/rdnajac/.files/etc/LS_PY)"
export EDITOR=/opt/nvim-macos-arm64/bin/nvim


# source "${THISDIR}/scripts/zsh/promptstring.zsh"
# source "${THISDIR}/scripts/zsh/clipboardfunctions.zsh"
# source "${THISDIR}/scripts/zsh/completion.zsh"
# FZF_ALT_C_COMMAND= source <(fzf --zsh)
# source "${THISDIR}/config/fzf.sh"
# source <(tree-sitter complete --shell zsh)

# load common aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# aliases for my laptop
alias brewup='brew update; brew upgrade; brew cleanup -s;'
alias ls='gls -F --color=auto --group-directories-first'
alias ctags='$(brew --prefix)/bin/ctags'
alias conda='micromamba'
alias mm='micromamba'
alias mminstall='micromamba install -c conda-forge -c bioconda'
alias Lazypath='cl ~/.local/share/nvim/lazy/'
# alias repro='nvim -u ~/GitHub/repro.lua'

# Enable command-line autocompletion
# autoload -Uz compinit && compinit
# autoload bashcompinit && bashcompinit

# Add custom completion scripts to the fpath
# fpath=(~/.zsh/completions $fpath)

# complete -C '/opt/homebrew/bin/aws_completer' aws
# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# zstyle ':completion:*:*:wezterm:*' script ~/.zsh/_wezterm

# add executables to PATH
export PATH=$PATH:$THISDIR/bin/
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/nvim-macos-arm64/bin
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

# edit config files
alias   ba='${EDITOR:-vim} $HOME/.bash_aliases'
alias  tmx='${EDITOR:-vim} $HOME/.tmux.conf'
alias alac='${EDITOR:-vim} $HOME/.alacritty.toml'
alias   zr='${EDITOR:-vim} ${ZDOTDIR:-HOME}/.zshrc'

export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/rdn/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__mamba_setup"
else
  alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# better cat
alias cat=bat
# better ls
alias ls=eza
# better cd
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z

# \cat "${THISDIR}"/dijkstra
