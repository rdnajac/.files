# export PATH=$PATH:$DOTDIR/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/nvim-macos-arm64/bin
export PATH=$PATH:/Library/Frameworks/R.framework/Resources/bin

export EDITOR=vim
export LS_COLORS="$($DOTDIR/etc/LS_PY)"

export HISTFILE=~/$ZDOTDIR/.zsh_history

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
