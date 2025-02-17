# THISDIR=$(cd "$(dirname "$0")" && pwd)
# THISDIR="$(cd "$(dirname "$0")" && git rev-parse --show-toplevel)"
THISDIR="/Users/rdn/Desktop/GitHub/rdnajac/.files"
setopt interactivecomments # Don't error on `#` in command line

LS_SCRIPT=$THISDIR/lscolors.py
export LS_COLORS="$($LS_SCRIPT)"
export EDITOR=/opt/nvim-macos-arm64/bin/nvim

source "${THISDIR}/bash_aliases"
source "${THISDIR}/scripts/zsh/promptstring.zsh"
# source "${THISDIR}/scripts/zsh/gitbranch.zsh"
source "${THISDIR}/scripts/zsh/clipboardfunctions.zsh"
source "${THISDIR}/scripts/zsh/completion.zsh"
source <(/opt/homebrew/bin/fzf --zsh)
source "${THISDIR}/config/fzf.sh"

# aliases for my laptop
alias brewup='brew update; brew upgrade; brew cleanup -s;'
alias ls='gls -F --color=auto --group-directories-first'
alias ctags='$(brew --prefix)/bin/ctags'
alias conda='micromamba'
alias mm='micromamba'
alias mminstall='micromamba install -c conda-forge -c bioconda'
alias Lazypath='cl ~/.local/share/nvim/lazy/'
alias repro='nvim -u ~/GitHub/repro.lua'
# set up Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# add executables to PATH
export PATH=$PATH:$THISDIR/bin-scripts/
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/nvim-macos-arm64/bin
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin
export PATH=$PATH:/opt/homebrew/Cellar/montage/6.0_1/bin/

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

# edit config files
alias   ba='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/bash_aliases'
alias   bf='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/bash_functions'
alias gitc='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/gitconfig'
alias  tmx='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/terminals/tmux.conf'
alias alac='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/terminals/alacritty.toml'
alias   wz='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/terminals/wezterm.lua'
alias   zr='${EDITOR:-vim} ~/Desktop/GitHub/rdnajac/.files/zshrc'

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
cat "${THISDIR}"/bin-scripts/dijkstra
