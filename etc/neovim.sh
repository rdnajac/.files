export MANPAGER="nvim +Man!"

export NVIM_SOCK="${XDG_RUNTIME_DIR:-$HOME/.cache}/nvim/server.pipe"
alias nv=e

alias zr='nvim ${ZDOTDIR}'
alias zrc='nvim ${ZDOTDIR}/.zshrc'
alias nn='nvim ${DOTDIR}/etc/nnn.sh'
alias zzz='nvim -c "lua Snacks.lazygit()"'
