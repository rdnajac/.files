## download this file with
## $ curl https://raw.githubusercontent.com/rdnajac/.files/refs/heads/main/home/.bash_aliases > "$HOME"/.bash_aliases
## Default .bashrc files automatically source `~/.bash_aliases` when present
## check out `/usr/share/doc/bash` for more resources

# uncomment the next line for a more intuitive default ls
# alias ls='ls -F --color=auto --human-readable --group-directories-first'
alias ll='ls -lA'
alias lll='ls -lAc --size -1 -S --classify'

# function to change directory and list files
cl() { builtin cd "${1:-$HOME}" && ls; }

# uncomment to make this the default cd
# alias cd=cl
alias bd='cd -'
alias ..'=cd ..'
alias ...'=cd ../..'
alias ....'=cd ../../..' # we have to go deeper
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# make verbose default
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vi'
alias rmf='rm -f'
alias rmrf='rm -rf'
alias rmd='rm -drvI'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'

alias link='ln -vsfFwh' # see `man ln`
alias lock='chmod -w'   # make a file read-only
alias chx='chmod u+x'   # make a file executable
# rsync all non-hidden files and directories
alias sync='rsync -avz --progress --exclude=".*"'

alias pip=pip3

# NOTE: pressing `<CTRL-Z> from (n)vim` suspends the process
alias zz=fg

# edit config files
alias ssx='${VISUAL} ${HOME}/.ssh/config'
alias ba='${VISUAL} ${HOME}/.bash_aliases'
alias alac='${VISUAL} ${HOME}/.config/alacritty/alacritty.toml'
alias kk='${VISUAL} ${HOME}/.config/kitty/kitty.conf'
alias vvv='${VISUAL} ${HOME}/.config/vim/vimrc'
alias tmx='${VISUAL} ${HOME}/.config/tmux/tmux.conf'

alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gcma='git commit -m -a'
alias gcl='git clone'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gba='git branch -a'
alias gsub='git submodule'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias explain='gh copilot explain '
alias \?\?='gh copilot suggest '

alias bmake='bear -- make'
alias kmake='cd ~/kernel_dev/linux && make -j $(nproc) && \
             sudo make modules_install && sudo make install'

alias pretty='prettier --write .'
alias rscript='Rscript'

alias qp='quarto preview'
alias qr='quarto render'

# alias tmux='tmux -2'
alias kms='tmux kill-server'

# fat fingers!
alias mg=mv
alias cim=vim

# clear scren and restart shell
ree() { clear -x && echo "(╯°□°)╯︵ ┻━┻" && exec "$SHELL"; }

# from bash examples
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'
