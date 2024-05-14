# vim: ft=sh fdm=marker fdl=1 wrap
alias myls='gls -F --color=auto --group-directories-first'
#alias ls='ls -F --color=auto --group-directories-first'
alias lt='myls -c --human-readable --size -1 -S --classify'
alias ll='myls -l'
alias lll='myls -lA'
alias lla='myls -lA'
alias llt='lt -lA'

alias rc='ruff check'
alias sc='shellcheck'

cl() { builtin cd "${1:-$HOME}" && ll -F --color=auto --group-directories-first;}
mdfix() { markdownlint -f $1 --disable MD013; }
checksh() { shellharden --replace $1 && shellcheck $1; }

# cd {{{1
alias cd='cl'
alias bd='cd -'
# go up `.` many directories {{{2
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..'
# we have to go deeper
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# shortcuts to projects {{{2
alias qq='cd ~/cbmf'
#alias qa='cd ~/project-a-series-of-tubes'
alias qs='cd ~/SOCKit'
alias qa='ca ~/SOCKit'
alias gg='cd ~/gscs/'
alias ff='cd ~/.files'
alias dt='cd ~/Desktop'
alias dl='cd ~/Downloads'

# shortcuts to vim folders {{{2
alias vv='cd ~/.vim'
alias vc='cd ~/.vim/colors'
alias vp='cd ~/.vim/after/plugin'
alias vf='cd ~/.vim/after/ftplugin'
alias plug='cd ~/.vim/pack/plugins/'
alias nvv=' cd ~/.config/nvim/lua/'

# }}}1

# file management {{{
alias mv='mv -vi'
alias rm='rm -vi'
alias cp='cp -vi'
alias mkdir='mkdir -v'
alias link='ln -vsfFwh' # see `man ln`
alias chx='chmod +x'    # make a file executable
alias lock='chmod -w'   # make a file read-only
alias sync='rsync -avz --progress'
ec2sync() { rsync -avz --progress "${1}" "aws:~/${2:-}"; }

# rm
alias rmf='rm -f'
alias rmrf='rm -rf'
alias rmd='rm -drvI'

# decompression wrapper with filetype detection
embiggen() {
  [[ "${1}" == *.gz  ]] && tar -xvzf "${1}"
  [[ "${1}" == *.tar ]] && tar -xvf  "${1}"
  [[ "${1}" == *.zip ]] && unzip     "${1}"
  [[ "${1}" == *.rar ]] && unrar x   "${1}"
  [[ "${1}" == *.7z  ]] && 7z x      "${1}"
  # add more as needed
}

alias unbiggen='tar -cvzf'
# }}}

alias grep='grep --color=auto'

# edit config files {{{2
# [TODO: use $EDITOR instead of vim]
alias vvv='vim ~/.vim/vimrc'
alias vvx='vim ~/.vim/xvimrc.vim'
alias ba=' vim ~/.files/bash_aliases'
alias alx='vim ~/.files/alacritty.toml'
alias ssx='vim ~/.ssh/config'
alias tmx='vim ~/.files/tmux.conf'

# executables {{{2
alias vi='vim'
alias nv='nvim'
alias p3='python3'
alias py3='python3'
alias db='dune build'
alias dc='dune clean'
alias df='dune fmt'

# tmux {{{2
alias tmux='tmux -2'
alias tma='tmux attach-session'
alias kms='tmux kill-server'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias td='tmux detach'

# git {{{2
alias ga=' git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gcl='git clone'
alias gp=' git push'
alias gs=' git status'
alias gd=' git diff'
alias gl=' git log'
alias gnew='git checkout -b'

# make {{{2
alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && make -j $(nproc) && \
                sudo make modules_install  -j $(nproc) && \
                sudo make install && sudo reboot'

# functions {{{1

# if you `source` this file you can use these functions
# they work like aliases but can take positional arguments

edit   () { touch "${1}" &&  tmux send-keys -t 0 ":e $(realpath "${1}")" Enter; }
vimba  () { [[ "${1}" == *.vba.gz ]] && vim -c "source %" -c "q" "${1}"; }
vimft  () { vim ~/.vim/after/ftplugin/"${1}".vim; }
vimaws () { vim scp://aws/"${1}"; }
cp1ec2 () { scp "aws:~/${1}" .; }
cp2ec2 () { scp "${1}" "aws:~/${2:-}"; }
ec2sync() { sync -avz --progress "${1}" "aws:~/${2:-}"; }
# note: `aws` is another alias; adjust accordingly
#
# run file on aws using ssh aws "bash -s" < file
awsexec () { ssh aws "bash -s" < "${1}"; }

gitstatusline()
{
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ ! -n "$branch" ]]; then echo "👾"; return; fi
    staged=$(git diff --cached --numstat | wc -l | tr -d ' ')
    unstaged=$(git diff --numstat | wc -l | tr -d ' ')
    untracked=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')
    ignored=$(git ls-files --others --exclude-standard --ignored | wc -l | tr -d ' ')
    echo -e "#[fg=black]${branch}#[fg=default] #[fg=blue]${staged}#[fg=default] #[fg=red]${unstaged}#[fg=default] #[fg=yellow]${untracked}#[fg=default] #[fg=magenta]${ignored}#[fg=default]"
}
#echo "${branch}" ✅"${staged}" ❌"${unstaged}" ❔"${untracked}" 🚫"${ignored}"
#echo -e "👾${branch}\t\t✅${staged}\t❌${unstaged}\t❔${untracked}\t🚫${ignored}"
#printf "👾%s\t✅%s\t❌%s\t❔%s\t🚫%s\n" "${branch}" "${staged}" "${unstaged}" "${untracked}" "${ignored}"
#echo -e "\e[1;30m${branch}\e[0m \e[1;34m${staged}\e[0m \e[1;31m${unstaged}\e[0m \e[1;33m${untracked}\e[0m \e[1;35m${ignored}\e[0m"
#echo -e "#[fg=black]${branch}#[fg=default] #[fg=blue]${staged}#[fg=default] #[fg=red]${unstaged}#[fg=default] #[fg=yellow]${untracked}#[fg=default] #[fg=magenta]${ignored}#[fg=default]"

alias mymysql='mysql -u labaf_ryan -p -h palomerolab.org --ssl-mode=REQUIRED'

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
ree () { clear -x; echo -e "(╯°□°)╯︵ ┻━┻"; exec $SHELL; }
