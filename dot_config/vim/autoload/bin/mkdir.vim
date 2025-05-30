function! bin#mkdir#mkdir(file) abort
  " Skip if URI scheme (e.g., http://, ftp://)
  if a:file =~# '^\w\+:[\\/][\\/]'
    return
  endif

  let l:path = expand(a:file)
  let l:resolved = resolve(l:path)
  let l:file = empty(l:resolved) ? a:file : l:resolved
  let l:dir = fnamemodify(l:file, ':p:h')

  if !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif
endfunction
