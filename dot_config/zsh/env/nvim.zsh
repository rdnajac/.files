export MANPAGER="nvim +Man!"
export NVIM_PIPE="${XDG_RUNTIME_DIR:-/tmp}/nvim.pipe"

alias lv='NVIM_APPNAME=lazyvim nvim'
alias repro='NVIM_APPNAME=repro nvim'
alias zzz='nvim -c "lua Snacks.lazygit()"'
alias nvr='nvim --headless --noplugin --server "$NVIM_SOCK" --remote-expr'

oil() {
	if [[ $1==*:* ]]; then
		h=${1%%:*}
		p=${1#*:}
	else
		h=$1
		p=~
	fi
	nvim oil-ssh://"$h/$p"
}

compdef _rsync oil
