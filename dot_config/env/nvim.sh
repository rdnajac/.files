export MANPAGER="nvim +Man!"

export NVIM_SOCK="${XDG_RUNTIME_DIR:-$HOME/.cache}/nvim/server.pipe"
alias nv=E
alias lv='NVIM_APPNAME=lazyvim nvim'
alias repro='NVIM_APPNAME=repro nvim'
alias zzz='nvim -c "lua Snacks.lazygit()"'
