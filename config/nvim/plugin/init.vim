" init.vim
let s:vimrc = expand('<sfile>')
" Open this file with <leader>v {{{
if !exists('*VimConfig')
  function! VimConfig() abort
    execute 'edit ' . s:vimrc
  endfunction
  nnoremap <leader>v :call VimConfig()<CR>
endif
" }}}
" Source this file with <leader>r to reload configuration {{{
if !exists('*ReloadVimConfig')
  function! ReloadVimConfig() abort
    execute 'source ' . s:vimrc | echo 'Sourced ' . s:vimrc . '!'
  endfunction
  nnoremap <leader>r :call ReloadVimConfig()<CR>
endif
" }}}
" options {{{
set completeopt=menu,preview,preinsert
set foldopen+=insert,jump
set iskeyword+=_
set listchars=trail:¿,tab:→\    " show trailing whitespace and tabs
set mousescroll=hor:0
set numberwidth=2
set shiftwidth=8
set sidescrolloff=0
set tabstop=8
set timeoutlen=420
set updatetime=69
set whichwrap+=<,>,[,],h,l
set wildmode=longest:full,full
" }}}
" keymaps {{{
" no Ex mode, instead Q formats and saves
nnoremap Q <nop>
nnoremap gQ <nop>

nmap <C-c> ciw
nmap <C-s> viW

" buffer navigation
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprev<CR>
nnoremap <localleader><Tab> :b#<CR>

" indent/dedent in normal mode with < and >
nnoremap > V`]>
nnoremap < V`]<

" duplicate and comment out line
nmap yc yygccp

" swap keys to avoid shift + key for common operations
nnoremap ` ~
nnoremap ~ `

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" cnoreabbrev !! !./%
cnoreabbrev ?? verbose set?<Left>
cnoreabbrev <expr> L getcmdtype() == ':' && getcmdline() ==# 'L' ? '<c-r><c-l>' : 'L'

" creating a command is less problematic than a cmdline abbreviation
command! Wq wqa!
" }}}
" autocmds {{{
augroup FileTypeSettings
  autocmd!
  " set default for all files, then override for specific filetypes
  autocmd FileType *              setlocal sw=2 sts=2   expandtab
  autocmd FileType sh             setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c              setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda       setlocal sw=4 sts=4
  autocmd FileType python         setlocal sw=4 sts=4
  " autocmd FileType tex            setlocal            fdm=syntax
  autocmd FileType vim,lua        setlocal sw=2 sts=2 kp=:help
  autocmd FileType vim,lua,sh     setlocal nonumber norelativenumber numberwidth=2
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
