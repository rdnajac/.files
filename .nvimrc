if exists('g:loaded_chezmoi_nvimrc') || !executable('chezmoi')
  finish
endif
let g:loaded_chezmoi_nvimrc = v:true
set runtimepath+=.
