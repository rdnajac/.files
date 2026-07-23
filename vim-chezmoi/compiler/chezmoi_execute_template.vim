" Vim compiler file
" Compiler:	chezmoi_execute_template

if exists('current_compiler')
  finish
endif
let current_compiler = 'chezmoi_execute_template'

let s:cpo_save = &cpo
set cpo-=C

CompilerSet errorformat& " use the default 'errorformat'
CompilerSet makeprg=chezmoi\ execute-template\ -\f\ %

let &cpo = s:cpo_save
unlet s:cpo_save
