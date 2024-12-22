setopt interactivecomments # Don't error on `#` in command line
# https://unix.stackexchange.com/questions/598440/zsh-indic-fonts-support-rendering-issue-which-is-working-fine-on-bash
# setopt COMBINING_CHARS
# export LC_COLLATE=C

source ~/.files/bash_aliases

source ~/.files/scripts/zsh/promptstring.zsh
# source ~/.files/scripts/zsh/gitbranch.zsh
source ~/.files/scripts/zsh/clipboardfunctions.zsh
source ~/.files/scripts/zsh/completion.zsh

alias zr='vim ~/.zshrc'
alias mm='micromamba'
alias conda='micromamba'
alias nvim='/opt/nvim-macos-arm64/bin/nvim'
alias brewup='brew update; brew upgrade; brew cleanup -s;'
alias vimfect='~/Desktop/rdnajac/vimfect/vimfect'
alias vim='nvim'
alias biovim='cd ~/.vim/pack/vimfect/start/vim-bioflow/'

# clone personal repos with ssh
Clone () { git clone "git@github.com:rdnajac/${1}.git"; }

# nvim oil-ssh://[username@]hostname[:port]/[path]
oil() { /opt/nvim-macos-arm64/bin/nvim oil-ssh://$1; }

# Set up Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up Ruby environment
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3 # run chruby to see actual version

# Add executables to PATH
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin
export PATH="$HOME/.cargo/bin:$PATH"

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
