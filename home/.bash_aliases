# check out `/usr/share/doc/bash` for examples

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
# TODO: use zoxide instead
alias dt='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias doc='cl ~/Documents'
alias G='cl ~/GitHub'
alias qq='cl ~/GitHub/palomerolab'
alias qqq='cl ~/GitHub/rdnajac'
alias ff='cl ~/GitHub/rdnajac/.files'

# make verbose default
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vi'
alias rmf='rm -f'
alias rmrf='rm -rf'
alias rmd='rm -drvI'
alias mkdir='mkdir -v'

alias link='ln -vsfFwh' # see `man ln`
alias chx='chmod u+x'   # make a file executable
alias lock='chmod -w'   # make a file read-only
# rsync all non-hidden files and directories
alias sync='rsync -avz --progress --exclude=".*"'

alias nv='nvim'
alias L='LAZY=1 nvim'
alias pnv='PROF=1 nvim'

# NOTE: pressing `<CTRL-Z> from (n)vim` suspends the process; fg brings it back
alias zz=fg

alias ssx='nvim ~/.ssh/config'
alias vvv='vim ~/.vim/vimrc'

# use the system default python3
alias p3='/usr/bin/python3'
alias pip=pip3

# alias tmux='tmux -2'
alias kms='tmux kill-server'

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
