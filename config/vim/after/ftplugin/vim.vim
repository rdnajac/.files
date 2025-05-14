" cnoreabbrev <expr> L getcmdtype() == ':' && getcmdline() ==# 'L' ? '<c-r><c-l>' : 'L'
"
function! L() abort
  let l:line = getline('.')
  " if ft is lua, prepend lua
  if &ft ==# 'lua'
    let l:line = 'lua ' . l:line
  endif
  execute line
  echom line
endfunction

command! L call L()
nnoremap <buffer> <silent> <localleader>l :L<CR>

imap <M-Up> <Up>
imap <M-Down> <Down>
imap <M-Left> <Left>
imap <M-Right> <Right>

setlocal iskeyword-=#
" setlocal foldmethod=marker
" setlocal foldlevel=0
