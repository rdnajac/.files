function! MyKeywordprg(...) abort
  let l:man_page = get(b:, 'man_page', '')
  if l:man_page == ''
    echohl ErrorMsg
    echo "No man page configured for this file. Set b:man_page in an autocmd."
    echohl None
    return
  endif
  " Get search term - either from args or word under cursor
  let l:key = a:0 >= 2 ? a:2 : expand('<cWORD>')
  echomsg 'Searching for ' . l:key . ' in Man ' . l:man_page
  execute 'Man ' . l:man_page
  call search('\<' . l:key . '\>')
endfunction

function! UseManPage(man_page) abort
  let b:man_page = a:man_page
  setlocal keywordprg=:MyKeywordprg
endfunction

command! -nargs=* MyKeywordprg call MyKeywordprg(<f-args>)

augroup ManHelpConfig
  autocmd!
  autocmd FileType tmux call UseManPage('tmux')
  autocmd FileType sshconfig call UseManPage('ssh')
  autocmd BufRead,BufNewFile *alacritty*.toml,*alacritty*.yml call UseManPage('5 alacritty')
augroup END
