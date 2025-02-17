alias ls='ls -F --color=auto --human-readable --group-directories-first'
alias ll='ls -lA'
alias lll='ls -lAc --size -1 -S --classify'

alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..' # we have to go deeper
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

cl() { builtin cd "${1:-$HOME}" && \ls; }
alias qq='cl ~/Desktop/GitHub/palomerolab'
alias qqq='cl ~/Desktop/GitHub/rdnajac'
alias G='cl ~/Desktop/GitHub'
alias ff='cl ~/Desktop/GitHub/rdnajac/.files'

# macos
alias dt='cl ~/Desktop'
alias dl='cl ~/Downloads'
alias doc='cl ~/Documents'

alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vi'
alias rmf='rm -f'
alias rmrf='rm -rf'
alias rmd='rm -drvI'
alias rmdir='rm -drvI'
alias mkdir='mkdir -v'

alias link='ln -vsfFwh' # see `man ln`
alias chx='chmod u+x'   # make a file executable
alias lock='chmod -w'   # make a file read-only
# rsync all non-hidden files and directories
alias sync='rsync -avz --progress --exclude=".*"'

alias v='vim'
alias nv='nvim'
alias vv='qqq && cd .vim'
alias nvv='qqq && cd nvim'
alias vvv='nvim ~/.vim/vimrc'
alias nvl='nvim ./**/*.lua'
# alias L='nvim'
alias L='LAZY=1 nvim'
alias pnv='PROF=1 nvim'

# NOTE: pressing `<CTRL-Z> from (n)vim` suspends the process; fg brings it back
alias zz=fg

alias  ssx='${EDITOR:-vim} ~/.ssh/config'
alias  pro='${EDITOR:-vim} ~/.profile'

alias vimmd='${EDITOR:-vim} ~/.vim/after/ftplugin/markdown.vim'
alias vimsh='${EDITOR:-vim} ~/.vim/after/ftplugin/sh.vim'

# use the system default python3
alias p3='/usr/bin/python3'
alias pip=pip3

# alias tmux='tmux -2'
alias tma='tmux attach-session'
alias kms='tmux kill-server'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias td='tmux detach'

alias   ga='git add'
alias  gaa='git add --all'
alias  gcm='git commit -m'
alias gcma='git commit -m -a'
alias  gcl='git clone'
alias   gp='git push'
alias   gs='git status'
alias   gd='git diff'
alias   gl='git log'
alias  gba='git branch -a'
alias gsub='git submodule'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias explain='gh copilot explain '
alias \?\?='gh copilot suggest '

alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && make -j $(nproc) && \
             sudo make modules_install && sudo make install'

# fat fingers!
alias mg='mv' # harder to quit than vim
alias cim='vim'

alias pretty='prettier --write .'
alias rscript='Rscript'
# vim: ft=sh
