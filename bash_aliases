echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."

if [[ $(uname) == "Darwin" ]]; then
	# brew install coreutils for GNU ls, etc.
	alias ls='gls'

	# brew install ctags
	# use Exuberant Ctags
	alias ctags='$(brew --prefix)/bin/ctags'

	# os-specific aliases
	alias copy='pbcopy'
	alias paste='pbpaste'
fi

# ls
alias myls='ls -F --color=auto --group-directories-first'
alias lt='myls -c --human-readable --size -1 -S --classify'
alias ll='myls -lA'
alias l='lt -lA'

# cd
cl() { builtin cd "${1:-$HOME}" && myls; }
alias cd='cl'
alias qq='cd ~/cbmf'
alias ff='cd ~/.files'
alias dt='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias me='cd ~/gscs/resume'
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..' # we have to go deeper
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# file management
alias mv='mv -vi'
alias rm='rm -vi'
alias cp='cp -vi'
alias mkdir='mkdir -v'
alias link='ln -vsfFwh' # see `man ln`
alias chx='chmod u+x'   # make a file executable
alias lock='chmod -w'   # make a file read-only
alias sync='rsync -avz --progress --exclude=".*"'

# rm
alias rmf='rm -f'
alias rmrf='rm -rf'
alias rmd='rm -drvI'

embiggen()
{
	case "$1" in 
		*.gz)  tar -xvzf "$1" ;;
		*.tar) tar -xvf "$1" ;;
		*.zip) unzip "$1" ;;
		*.rar) unrar x "$1" ;;
		*.7z)  7z x "$1" ;;
		*) echo "embiggen: unknown file type" ;;
	esac
}
alias unbiggen='tar -cvzf'

alias grep='grep --color=auto'

# vim aliases
alias cim='vim'
alias v='vim'
alias vv='cd ~/.vim'
alias vvv='vim ~/.vim/vimrc'
alias vc='vim ~/.vim/colors/scheme.vim' 
alias vp='vim ~/.vim/after/plugin/config.vim'
alias vimmd='vim ~/.vim/after/ftplugin/markdown.vim'
alias vimsh='vim ~/.vim/after/ftplugin/sh.vim'
alias vimpy='vim ~/.vim/after/ftplugin/python.vim'
alias timtex='vim ~/.vim/after/ftplugin/tex.vim'
alias pack='cd ~/.vim/pack/vimfect'

alias nv='nvim'
alias nvv=' cd ~/.config/nvim/lua/'

alias sesh='tmuxp load ~/.files/tmuxp.yaml'

# edit config files
alias ba='vim ~/.files/bash_aliases'
alias ssx='vim ~/.ssh/config'
alias tmx='vim ~/.files/tmux.conf'
alias alac='vim ~/.files/alacritty.toml'

# use the system default python3
alias p3='/usr/bin/python3'

alias tmux='tmux -2'
alias tma='tmux attach-session'
alias kms='tmux kill-server'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias td='tmux detach'

alias ga=' git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gcl='git clone'
alias gp=' git push'
alias gs=' git status'
alias gd=' git diff'
alias gl=' git log'
alias gnew='git checkout -b'
alias gba='git branch -a'
alias gsub='git submodule'

alias ex='gh copilot explain'
alias suggest='gh copilot suggest'

alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && make -j $(nproc) && \
             sudo make modules_install && sudo make install'

alias mdfmt='prettier --write **/*.md'

alias mymysql='mysql -u labaf_ryan -p -h palomerolab.org --ssl-mode=REQUIRED'

ree() { clear -x; echo -e "(╯°□°)╯︵ ┻━┻"; exec "$SHELL"; }

# function to tmux send keys pane 0 
# and change to the pane
edit()
{
	local fullpath=$(readlink -f $1)
	tmux send-keys -t 0 ":e $fullpath" Enter
	tmux select-pane -t 0
}

# vim: ft=sh fdm=marker wrap
