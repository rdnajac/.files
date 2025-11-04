export NVIM_PIPE="${XDG_RUNTIME_DIR:-/tmp}/nvim.pipe"

alias nvr='nvim --headless --noplugin --server "$NVIM_SOCK" --remote-expr'
alias lv='NVIM_APPNAME=lazyvim nvim'
alias repro='NVIM_APPNAME=repro nvim'
alias zzz='nvim +"lua Snacks.lazygit()" +"startinsert"'

_nvim_oilssh_passthrough() {
  if [[ ${words[CURRENT]} == oil-ssh://* ]]; then
    words[CURRENT]=${words[CURRENT]#oil-ssh://}
  fi
  _rsync
}

compdef _nvim_oilssh_passthrough nvim

: '
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
'
