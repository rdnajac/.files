function! s:edit_config(file) abort
  let l:target = expand('~/.config/' . a:file)
    " let l:edit = 'ChezmoiEdit'
    let l:edit = 'edit'
  execute printf('%s %s', l:edit, fnameescape(l:target))
endfunction
