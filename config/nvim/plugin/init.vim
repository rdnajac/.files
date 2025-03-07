" init.vim
" make sure these commands run first!
" vim sources files alphebetically, so this file should be named _init.vim
" for neovim config, keep this as the only file in plugin/

" Define a variable outside any function blocks to store the path to this file
let s:vimrc = expand('<sfile>')

if !exists('*ReloadVimConfig')
  function! ReloadVimConfig() abort
    execute 'source ' . s:vimrc | echo 'Sourced ' . s:vimrc . '!'
  endfunction
endif

if !exists('*VimConfig')
  function! VimConfig() abort
    execute 'edit ' . s:vimrc
  endfunction
endif

" Just like my vimrc!
nnoremap <leader>v :call VimConfig()<CR>
nnoremap <leader>r :call ReloadVimConfig()<CR>

" no Ex mode, instead Q formats and saves
nnoremap Q <nop>
nnoremap gQ <nop>
" avoid conflicts with tmux
nnoremap <C-f> <nop>

set autoread
set autowrite
set completeopt=menu,preview,preinsert
set cursorline
set foldopen+=insert,jump
set formatoptions-=o
set ignorecase smartcase
set inccommand=nosplit
set iskeyword+=_
set linebreak breakindent
set list
set mouse=a
set mousescroll=hor:0
set number relativenumber
set numberwidth=2
set pumheight=10
set report=0
set scrolloff=5
set shiftround
set shiftwidth=8
set showmatch
set sidescrolloff=0
set splitbelow splitright
set splitkeep=screen
set tabstop=8
set termguicolors
set timeoutlen=420
set updatetime=69
set whichwrap+=<,>,[,],h,l
set wildmenu
set wildmode=longest:full,full

set fillchars+=diff:╱,
set fillchars+=eob:\ ,
set fillchars+=fold:\ ,
set fillchars+=foldsep:\ ,
set fillchars+=foldopen:▾,
set fillchars+=foldclose:▸,
set fillchars+=foldsep:│
set fillchars+=stl:\ ,

set listchars=trail:¿,tab:→\    " show trailing whitespace and tabs

" Quit immediately if we accidentally open a command window
augroup noCmdwin | autocmd! | autocmd CmdwinEnter * quit |  augroup END

" Set shiftwidth and softtabstop for different filetypes {{{
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

nmap <c-c> ciw
nmap <c-s> viW
vnoremap <C-s> :sort<CR>

" buffer navigation
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprev<CR>
nnoremap <localleader><Tab> :b#<CR>

" indent/dedent in normal mode with < and >
nnoremap > V`]>
nnoremap < V`]<

" paste without overwriting the clipboard
xnoremap <silent> p "_dP
vnoremap <silent> p "_dP

" duplicate and comment out line
nmap yc yygccp

" quickly edit the current buffer's ~/.vim/after/ftplugin/.. &ft .. .vim
nmap <localleader>ft :e ~/.vim/after/ftplugin/<C-R>=&ft<CR>.vim<CR>

" better indenting
vnoremap < <gv
vnoremap > >gv

" swap keys to avoid shift + key for common operations
nnoremap ` ~
nnoremap ~ `

nnoremap ; :
nnoremap : ;

" cnoreabbrev !! !./%
cnoreabbrev ?? verbose set?<Left>
cnoreabbrev <expr> L getcmdtype() == ':' && getcmdline() ==# 'L' ? '<c-r><c-l>' : 'L'

" creating a command is less problematic than a cmdline abbreviation
command! Wq wqa!

" let g:loaded_apathy = 1 " {{{
if &g:path =~# '\v^\.,/%(usr|emx)/include,,$'
  setglobal path=.,,
endif

setglobal isfname+=@-@
" }}}
" vim: fdm=marker fdl=0

