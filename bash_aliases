# vim: ft=sh fdm=marker
alias cd='cl'
alias ree='clear -x; echo -e "(╯°□°)╯︵ ┻━┻"; exec $SHELL'

# quick access
alias qq='cd ~/gscs/'
alias qa='cd ~/project-a-series-of-tubes'
alias ff='cd ~/.files'

alias ll='ls -AlFh --group-directories-first'
alias l='ls -lFh --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'

alias mv='mv -vi'
alias rm='rm -vi'
alias cp='cp -vi'
alias mkdir='mkdir -pv'
alias rmdir='rm -drvI'

# navigation {{{1
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'

# shortcuts to vim folders {{{1
alias plug='cd ~/.vim/pack/plugins/start'
alias vc='cd ~/.vim/colors'
alias vp='cd ~/.vim/after/plugin'
alias vfp='cd ~/.vim/after/ftplugin'
alias nvv='cd ~/.config/nvim/lua/ '

# edit config files in vim {{{1
alias vx='vim ~/.files/vim/vimrcx.vim'
alias ba='vim ~/.files/bash_aliases'
alias alac='vim ~/.files/alacritty.toml'

# executables {{{1
alias vi='vim'
alias nv='nvim'
alias p3='python3'
alias py3='python3'
alias db='dune build '

# tmux {{{1
alias tmux='tmux -2'
alias tmx='tmux attach-session'
alias tmxx='vim ~/.files/tmux.conf'
alias kms='tmux kill-server'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias td='tmux detach'

# git {{{1
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gcl='git clone'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'

# make {{{1
alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && \
                sudo make -j && \
                sudo make modules_install -j3 && \
                sudo make install && sudo reboot'
# }}}

alias vimfect='/Users/rdn/.files/vim/pack/plugins/start/vimfect.sh'

# functions {{{1

# cd to a directory and list its contents {{{2
function cl() {
    DIR="$*";
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && l
}

# tell other tmux pane to edit a file in vim{{{2
edit() {
    if [ ! -f "$1" ]; then
        touch "$1"
    fi
    local filename=$(realpath "$1")
    tmux send-keys -t 0 ":e $filename" Enter
}

