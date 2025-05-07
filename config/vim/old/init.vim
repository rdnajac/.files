" init.vim (like vimrc but for my neovim config)

let s:vimrc = expand('<sfile>')

" Edit this file with `<leader>v`
if !exists('*VimConfig')
  function! VimConfig() abort
    execute 'edit ' . s:vimrc
  endfunction
  nnoremap <leader>v :call VimConfig()<CR>
endif

" Source this file with `<leader>r` to reload configuration
if !exists('*ReloadVimConfig')
  function! ReloadVimConfig() abort
    execute 'source ' . s:vimrc | echo 'Sourced ' . s:vimrc . '!'
    " source autoload/ooze.vim
  endfunction
  nnoremap <leader>r :call ReloadVimConfig()<CR>
endif
