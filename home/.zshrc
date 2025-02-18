# THISDIR=$(cd "$(dirname "$0")" && pwd)
# THISDIR="$(cd "$(dirname "$0")" && git rev-parse --show-toplevel)"
THISDIR="/Users/rdn/Desktop/GitHub/rdnajac/.files/"
setopt interactivecomments # Don't error on `#` in command line

export LS_COLORS="$(/Users/rdn/Desktop/GitHub/rdnajac/.files/etc/LS_PY)"
export EDITOR=/opt/nvim-macos-arm64/bin/nvim

eval "$(/opt/homebrew/bin/brew shellenv)"

source "${THISDIR}/scripts/zsh/promptstring.zsh"
# source "${THISDIR}/scripts/zsh/gitbranch.zsh"
source "${THISDIR}/scripts/zsh/clipboardfunctions.zsh"
source "${THISDIR}/scripts/zsh/completion.zsh"
# source <(/opt/homebrew/bin/fzf --zsh)
FZF_ALT_C_COMMAND= source <(fzf --zsh)
source "${THISDIR}/config/fzf.sh"

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
alias   zr='${EDITOR:-vim} $HOME/.zshrc'

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
cat "${THISDIR}"/bin/dijkstra

# better cat
alias cat=bat
# better cd
eval "${$(zoxide init zsh):s#_files -/#_cd#}"
alias cd=z
