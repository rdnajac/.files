source ~/.files/bash_aliases
alias zr='vim ~/.zshrc'
alias vimhome='cd /opt/homebrew/Cellar/vim/9.1.0600/share/vim/vim91/'

copy() {
    echo "copy called with arguments: $@"
    pbcopy < "${1:-/dev/stdin}"
    printf "\033[0;31mCopied contents of %s to clipboard\033[0m\n" "${1:-/dev/stdin}"
}

paste() {
    echo "paste called with arguments: $@"
    pbpaste > "${1:-/dev/stdout}"
    printf "\033[0;31mPasted contents of clipboard to %s\033[0m\n" "${1:-/dev/stdout}"
}

# Set up Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable command-line autocompletion
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

# Add custom completion scripts to the fpath
fpath=(~/.zsh $fpath)

# Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# AWS CLI completion
complete -C '/opt/homebrew/bin/aws_completer' aws


autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_

NEWLINE=$'\n'
PSPWD='%F{blue}%~%f'
PSTIME='%F{magenta}%D{%s}%f'
PSERROR='%(?.√.%F{red}exit %F{yellow}%?)%f'
PSRUB="₽ "
PS1="${PSTIME} ${PSPWD} ${PSERROR}${NEWLINE}${PSRUB}"

# ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3 # run chruby to see actual version

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/rdn/Desktop/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
alias mm='micromamba'
export PATH=$PATH:/opt/aws/mountpoint-s3/bin
