setopt interactivecomments # Don't error on `#` in command line
# https://unix.stackexchange.com/questions/598440/zsh-indic-fonts-support-rendering-issue-which-is-working-fine-on-bash
# setopt COMBINING_CHARS
# export LC_COLLATE=C

export EDITOR=/opt/nvim-macos-arm64/bin/nvim

source ~/.files/bash_aliases

source ~/.files/scripts/zsh/promptstring.zsh
# source ~/.files/scripts/zsh/gitbranch.zsh
source ~/.files/scripts/zsh/clipboardfunctions.zsh
source ~/.files/scripts/zsh/completion.zsh

# aliases for my laptop
alias ls='gls -F --color=auto --group-directories-first'
alias ctags='$(brew --prefix)/bin/ctags'
alias mm='micromamba'
alias conda='micromamba'
alias brewup='brew update; brew upgrade; brew cleanup -s;'

# clone personal repos with ssh
Clone () { git clone "git@github.com:rdnajac/${1}.git"; }

# set up Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# add executables to PATH
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/nvim-macos-arm64/bin
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin

# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/rdn/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
