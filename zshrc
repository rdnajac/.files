source ~/.files/bash_aliases
source ~/.files/zsh/promptstring.zsh
# source ~/.files/zsh/gitbranch.zsh
source ~/.files/zsh/clipboardfunctions.zsh
source ~/.files/zsh/completion.zsh

alias zr='vim ~/.zshrc'
alias mm='micromamba'
alias conda='micromamba'

alias nvim='/opt/nvim-macos-arm64/bin/nvim'

# Set up Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up Ruby environment
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3 # run chruby to see actual version

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

# add Rscript to path
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin

# warning: be sure to add `/Users/rdn/.cargo/bin` to your PATH to be able to run the installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

setopt interactivecomments
