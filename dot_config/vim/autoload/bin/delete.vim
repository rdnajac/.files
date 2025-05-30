function! s:rm(path) abort
  return isdirectory(a:path) ? delete(a:path, 'd') : delete(a:path)
endfunction

function! s:error(file) abort
  return empty(getftype(a:file))
        \ ? 'Could not find "' . a:file . '" on disk'
        \ : 'Failed to delete "' . a:file . '"'
endfunction

function! bin#delete#delete(...) abort
  let bang = a:0 > 0 ? a:1 : 0
  let file = expand('%:p')

  if !bang && line('$') > 1 && !empty(getline(1))
    echoerr "File not empty (add ! to override)"
    return
  endif

  execute 'bdelete' . (bang ? '!' : '')

  if !bufloaded(file)
    if s:rm(file)
      echoerr s:error(file)
    endif
  endif
endfunction
