" TODO:
" runtime! sh.vim

setlocal isfname+={,}
setlocal isfname-==
if exists('g:autoloaded_apathy')
  call apathy#Prepend('path', apathy#EnvSplit($PATH))
  setlocal include=^\\s*\\%(\\.\\\|source\\)\\s
  setlocal define=\\<\\%(\\i\\+\\s*()\\)\\@=
  call apathy#Undo()
endif


