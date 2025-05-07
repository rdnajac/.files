if exists('g:loaded_eunuch_delete')
  finish
endif
let g:loaded_eunuch_delete = 1

function! s:Delete(path) abort
  if isdirectory(a:path)
    return delete(a:path, 'd')
  else
    return delete(a:path)
  endif
endfunction

function! s:DeleteError(file) abort
  if empty(getftype(a:file))
    return 'Could not find "' . a:file . '" on disk'
  else
    return 'Failed to delete "' . a:file . '"'
  endif
endfunction

function! Delete(...) abort
  let bang = a:0 > 0 ? a:1 : 0
  let l:file = expand('%:p')

  if !bang && line('$') > 1 && !empty(getline(1))
    echoerr "File not empty (add ! to override)"
    return
  endif

  execute 'bdelete' . (bang ? '!' : '')

  if !bufloaded(l:file)
    if s:Delete(l:file)
      echoerr s:DeleteError(l:file)
    endif
  endif
endfunction

command! -bar -bang Delete call Delete(<bang>0)
