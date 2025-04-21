export MANPAGER="nvim +Man!"
export NVIM_SOCK="${XDG_RUNTIME_DIR:-$HOME/.cache}/nvim/server.pipe"

alias L='LAZY=1 nvim'
alias nvserver='nvim --listen "$NVIM_SOCK"'
alias pnv='PROF=1 nvim'

alias zr='nvim $ZDOTDIR'
alias nn='nvim ${DOTDIR}/etc/nnn.sh'
alias zzz='nvim -c "lua Snacks.lazygit()"'
alias cfg='nvim -c "lua Snacks.picker.dotfiles()"'
