" init.vim
let s:vimrc = expand('<sfile>')
" Edit this file with `<leader>v` {{{
if !exists('*VimConfig')
  function! VimConfig() abort
    execute 'edit ' . s:vimrc
  endfunction
  nnoremap <leader>v :call VimConfig()<CR>
endif
" }}}
" Source this file with `<leader>r` to reload configuration {{{
if !exists('*ReloadVimConfig')
  function! ReloadVimConfig() abort
    execute 'source ' . s:vimrc | echo 'Sourced ' . s:vimrc . '!'
  endfunction
  nnoremap <leader>r :call ReloadVimConfig()<CR>
endif
" }}}
" -------------------------------------------------------------
" general options {{{
set completeopt=menu,preview,preinsert,longest
set foldopen+=insert,jump
set iskeyword+=_
set wildmode=longest:full,full
" }}}
" terminal key mappings {{{
" double-tap comma to escape to normal mode from terminal
tnoremap <silent> ,, <C-\><C-n>

" ctrl + c to quit terminal mode
tnoremap <silent> <C-c> <Cmd>q!<CR>
" }}}
" no Ex mode, instead Q formats and saves " {{{
nnoremap Q <nop>
nnoremap gQ <nop>
" }}}
" Swap <Shift> modifier for some keys {{{
nnoremap ` ~
nnoremap ~ `
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" }}}
" command line mappings {{{
" cnoreabbrev !! !./%
cnoreabbrev ?? verbose set?<Left>
cnoreabbrev <expr> L getcmdtype() == ':' && getcmdline() ==# 'L' ? '<c-r><c-l>' : 'L'

" creating a command is less problematic than a cmdline abbreviation
command! Wq wqa!
" }}}

augroup FileTypeSettings " {{{
  autocmd!
  " set default for all files, then override for specific filetypes
  autocmd FileType *              setlocal sw=2 sts=2   expandtab
  autocmd FileType sh             setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c              setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda       setlocal sw=4 sts=4
  autocmd FileType python         setlocal sw=4 sts=4
  " autocmd FileType tex            setlocal            fdm=syntax
  autocmd FileType vim,lua        setlocal sw=2 sts=2 kp=:help
  autocmd FileType vim,lua,sh     setlocal nonumber norelativenumber
augroup END
" }}}
" ignored files and directories {{{
set wildignore+=*.o,*.out,*.a,*.so,*.lib,*.bin,*/.git/*,*.swp,*.swo,
set wildignore+=*.pdf,*.aux,*.fdb_latexmk,*.fls " LaTeX files
set wildignore+=*.zip,*.tar.gz,*.rar,*.7z,*.tar.xz,*.tgz " compressed files
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.tiff,*.ico,*.svg,*.webp,*.img
set wildignore+=*.mp*p4,*.avi,*.mkv,*.mov,*.flv,*.wmv,*.webm,*.m4v,*.flac,*.wav
set wildignore+=*.dylib,*.app,*.dmg,*.DS_Store,*.exe,*.dll,*.msi,Thumbs.db
" }}}
" vim: fdm=marker fdl=0
