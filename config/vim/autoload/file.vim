" autoload/file.vim
function! file#automkdir(file)
  if a:file =~# '^\w\+:[\\/][\\/]'
    return
  endif
  let l:file = resolve(expand(a:file)) ==# '' ? a:file : resolve(expand(a:file))
  let l:dir = fnamemodify(l:file, ':p:h')
  if !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif
endfunction
