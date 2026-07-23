if exists('g:loaded_chezmoi_nvimrc') || !executable('chezmoi')
  finish
endif
let g:loaded_chezmoi_nvimrc = v:true
set runtimepath+=.

let s:tmpl = expand('<sfile>:p:h') . '/plugin/chezmoi.vim.tmpl'
if filereadable(s:tmpl)
  let s:out = tempname()
  call writefile(systemlist('chezmoi execute-template < ' . shellescape(s:tmpl)), s:out)
  execute 'source' fnameescape(s:out)
endif
