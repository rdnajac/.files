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
}'

compdef _rsync oil
# set up Ruby environment
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3 # run chruby to see actual version

# yazi
# https://yazi-rs.github.io/docs/quick-start/#shell-wrapper
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
