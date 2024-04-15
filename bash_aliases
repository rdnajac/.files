# vim: ft=sh fdm=marker

alias cd='cl'
alias ree='clear -x; echo -e "(╯°□°)╯︵ ┻━┻"; exec $(basename $SHELL)'

alias ll='ls -AlFh --group-directories-first'
alias l='ls -lFh --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'
# quick access 
alias qq='cd ~/gscs/'     
alias qa='cd ~/project-a-series-of-tubes'
alias ff='cd ~/.files'

# executables
alias vi='vim'
alias nv='nvim'
alias p3='python3'
alias py3='python3'
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'
alias vp='cd ~/.files/vim/pack/plugins/start'
alias vpp='cd ~/.files/vim/after/plugin'
alias db='dune build '
alias vimm='vim ~/.files/vim/vimrcx.vim'
alias vimc='cd ~/.files/vim/colors'
alias sha='vim ~/.files/bash_aliases'
alias nvv='cd ~/.config/nvim/lua/ && ll'
alias alac='vim ~/.files/alacritty.toml'
alias tmux='tmux -2'
alias tmx='tmux attach-session'
alias tmxx='vim ~/.files/tmux.conf'
alias kms='tmux kill-server'
alias mv='mv -vi'
alias rm='rm -vi'
alias cpv='rsync -ahv --info=progress2'
alias rmdir='rm -drvI'
# git {{{
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gcl='git clone'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
# }}}
alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && \
                sudo make -j && \
                sudo make modules_install -j3 && \
                sudo make install && sudo reboot'

function cl() {
    DIR="$*";
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && l
}

edit() {
    if [ ! -f "$1" ]; then
        touch "$1"
    fi
    local filename=$(realpath "$1")
    tmux send-keys -t 0 ":e $filename" Enter
}

alias vimfect='/Users/rdn/.files/vim/pack/plugins/start/vimfect.sh'
