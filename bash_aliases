echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
export LS_COLORS="$(~/.files/extra/lscolors.py)"

if [ "$(uname)" = "Darwin" ]; then
	# use GNU ls and exuberant ctags on macOS
	# brew install coreutils ctags
	alias ls='gls -F --color=auto --group-directories-first'
	alias ctags='$(brew --prefix)/bin/ctags'
else
	# not supported on macOS
	alias ls='ls -F --color=auto --human-readable --group-directories-first'
fi

alias ll='ls -lA'
alias lll='ls -lAc --size -1 -S --classify'
cl() { builtin cd "${1:-$HOME}" && ls; }
alias qq='cl ~/Desktop/rdnajac/cpp-sandbox/src'
alias ff='cl ~/.files'
alias dt='cl ~/Desktop'
alias dl='cl ~/Downloads'
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..' # we have to go deeper
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

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
alias nvv='vim ~/.config/nvim/init.lua'

# edit config files
alias ba='vim ~/.files/bash_aliases'
alias ssx='vim ~/.ssh/config'
alias tmx='vim ~/.files/tmux.conf'
alias alac='vim ~/.files/alacritty.toml'
alias gitc='vim ~/.files/gitconfig'

# use the system default python3
alias p3='/usr/bin/python3'

# alias tmux='tmux -2'
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
alias gba='git branch -a'
alias gsub='git submodule'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias explain='gh copilot explain'
alias suggest='gh copilot suggest'

alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && make -j $(nproc) && \
             sudo make modules_install && sudo make install'

# fat fingers!
alias mg='mv' # harder to quit than vim
alias cim='vim'

ree() {
	clear -x
	echo -e "(╯°□°)╯︵ ┻━┻"
	exec "$SHELL"
}

alias jekyll='bundle exec jekyll'
alias serve='micromamba run -n mkdocs mkdocs serve'
alias pretty='prettier --write .'
alias pip=pip3
alias zz=fg

alias vimcuda='vim scp://rdnCUDA/~/CLionProjects/cuda/'

CML() { touch CMakeLists.txt; }
