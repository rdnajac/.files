" vim/autoload/utils.vim

function! utils#breakHere() abort
  let line = getline('.')
  let col = col('.')
  let before = strpart(line, 0, col - 1)
  let after = strpart(line, col - 1)
  call setline('.', before)
  call append('.', after)
endfunction

function! utils#replaceSelection() abort
    normal! gv"xy
    let sel = getreg('x')
    let rep = input('Replace all instances of "' . sel . '" with: ')
    if rep != ''
      let cmd = ':%s/' . escape(sel, '/\') . '/' . escape(rep, '/\') . '/g'
      exe cmd
    endif
endfunction

