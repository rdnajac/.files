" vim/autoload/run.vim

function! run#line() abort
  echom 'run#line'
  let cmd = getline('.')
  let output = systemlist(cmd)
  call g:Popup(output, cmd)
  let @+ = join(output, "\n")
endfunction

" function! run#file() abort
"   let cmd = './' . expand('%')
"   let output = systemlist(cmd)
"   call s:copyToClipboardAndShowPopup(joined_output)
" endfunction

" function! run#file_with_args(...) abort
"   let cmd = './' . expand('%') . ' ' . join(a:000, ' ')
"   let output = systemlist(cmd)
"   call g:PopupShow(join(output, "\n"))
" endfunction

"selects the current line and runs it as a shell command

function! run#visual() abort
  let lines = getline("'<", "'>")
  let cmd = join(lines, "\n")
  let output = systemlist(cmd)
  call g:PopupShow(join(output, "\n"))
endfunction

function! run#buffer() abort
  let cmd = join(getline(1, '$'), "\n")
  let output = systemlist(cmd)
  call g:PopupShow(join(output, "\n"))
endfunction

function! run#visual_selection_as_vimscript() abort
  let lines = getline("'<", "'>")
  let vimscript_code = join(lines, "\n")
  let result = execute(vimscript_code)
  call g:PopupShow(result)
endfunction
