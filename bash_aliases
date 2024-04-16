# vim: ft=sh fdm=marker fdl=1
alias ree='clear -x; echo -e "(╯°□°)╯︵ ┻━┻"; exec $SHELL'

# file management {{{1
alias mv='mv -vi'
alias rm='rm -vi'
alias cp='cp -vi'
alias mkdir='mkdir -pv'
alias rmdir='rm -drvI'

# navigation shortcuts {{{1
alias cd='cl'
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'

# projects {{{2
alias qq='cd ~/gscs/'
alias qa='cd ~/project-a-series-of-tubes'
alias ff='cd ~/.files'

# vim folders {{{2
alias vv='cd ~/.vim'
alias vc='cd ~/.vim/colors'
alias vp='cd ~/.vim/after/plugin'
alias vfp='cd ~/.vim/after/ftplugin'
alias plug='cd ~/.vim/pack/plugins/start'
alias nvv='cd ~/.config/nvim/lua/ '

# ls with flags {{{1
alias ll='ls -AlFh --group-directories-first'
alias l='ls -lFh --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'

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

# tmux {{{2
alias tmux='tmux -2'
alias tmx='tmux attach-session'
alias tmxx='vim ~/.files/tmux.conf'
alias kms='tmux kill-server'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias td='tmux detach'

# git {{{2
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gcl='git clone'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'

# make {{{2
alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && \
                sudo make -j && \
                sudo make modules_install -j3 && \
                sudo make install && sudo reboot'
# }}}

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

