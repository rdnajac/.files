"=============================================================================
" MyKeywordprg.vim - Contextual :Man lookup for keywords under cursor
" Maintainer: me
" License:    MIT
" Version:    1.0
"=============================================================================

if exists('g:loaded_mykeywordprg')
  finish
endif
let g:loaded_mykeywordprg = 1

command! -nargs=* MyKeywordprg call s:MyKeywordprg(<f-args>)

" Execute contextual man page search
function! s:MyKeywordprg(...) abort
  let l:man_page = get(b:, 'man_page', '')
  if empty(l:man_page)
    echohl ErrorMsg
    echo "No man page configured. Use UseMyKeywordprg() to set b:man_page."
    echohl None
    return
  endif

  let l:key = a:0 >= 1 ? a:1 : expand('<cWORD>')
  echomsg 'Searching for "' . l:key . '" in man page: ' . l:man_page

  execute 'Man ' . l:man_page
  call search('\<' . l:key . '\>')
endfunction

" Set man page context and activate :MyKeywordprg
function! UseMyKeywordprg(man_page) abort
  let b:man_page = a:man_page
  setlocal keywordprg=:MyKeywordprg
endfunction

" Autocommands for known filetypes
augroup MyKeywordprgSetup
  autocmd!
  autocmd FileType tmux        call UseMyKeywordprg('tmux')
  autocmd FileType sshconfig   call UseMyKeywordprg('ssh')
  autocmd BufRead,BufNewFile *alacritty*.toml,*alacritty*.yml call UseMyKeywordprg('5 alacritty')
augroup END
