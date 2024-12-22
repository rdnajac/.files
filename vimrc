" vimrc
set undofile swapfile backup
let s:VIMHOME    = expand('$HOME/.vim/')
let &undodir     = s:VIMHOME . '.undo//'
let &directory   = s:VIMHOME . '.swap//'
let &backupdir   = s:VIMHOME . '.backup//'
let &viminfofile = s:VIMHOME . '.viminfo'
let &spellfile   = s:VIMHOME . '.spell/en.utf-8.add'
" let &verbosefile = s:VIMHOME . '.vimlog.txt'
" TODO let git handle this with `gitkeep` files
if !isdirectory(&undodir)   | call mkdir(&undodir,   'p', 0700) | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p', 0700) | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    exec 'autocmd VimEnter * PlugInstall --sync | source $MYVIMRC'
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end() " automatically executes `filetype plugin indent on` and `syntax enable`

set termguicolors
set runtimepath+=~/.local/share/nvim/lazy/tokyonight.nvim/extras/vim
silent! colorscheme tokyonight-night
" uncomment for transparent background
" hi Normal guibg=NONE

set autochdir autoread autowrite
set mouse=a
set splitbelow splitright
set linebreak breakindent
set ignorecase smartcase
set whichwrap+=<,>,[,],h,l
set completeopt=menuone,noselect,preview
set cursorline
set foldopen+=insert,jump
set showmatch
set timeoutlen=420
set updatetime=69

" keymaps
nnoremap ; :
cnoremap ; :
vnoremap ; <CR>
cnoremap ?? verbose set?<Left>

" vim: ft=vim fdm=marker sw=2 sts=2
