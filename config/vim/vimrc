" vimrc
scriptencoding utf-8

" let s:VIMHOME    = expand('$HOME/.vim/')
let s:VIMHOME    = expand('$XDG_CONFIG_HOME/vim/')
let g:plug_home  = s:VIMHOME . '/.plugged//'
let &backupdir   = s:VIMHOME . '.backup//'
let &directory   = s:VIMHOME . '.swap//'
let &undodir     = s:VIMHOME . '.undo//'
let &viminfofile = s:VIMHOME . '.viminfo'
let &spellfile   = s:VIMHOME . '.spell/en.utf-8.add'
" let &verbosefile = s:VIMHOME . '.vimlog.txt'
set undofile swapfile backup

set autowrite
set cursorline
set formatoptions-=o
set ignorecase smartcase
set list
set mouse=a
set number relativenumber
set pumheight=10
set scrolloff=4
set shiftround
set splitbelow splitright
set splitkeep=screen
set termguicolors
set linebreak breakindent
set showmatch
set report=0
set fillchars+=diff:╱,
set fillchars+=eob:\ ,
set fillchars+=fold:\ ,
set fillchars+=foldclose:▸,
set fillchars+=foldopen:▾,
set fillchars+=foldsep:\ ,
set fillchars+=foldsep:│
set fillchars+=stl:\ ,
set listchars=trail:¿,tab:→\
set numberwidth=2
set shiftwidth=8
set sidescrolloff=0
set tabstop=8
set timeoutlen=420
set updatetime=69
set whichwrap+=<,>,[,],h,l

" TODO: make sure these are final
set completeopt=menu,preview,preinsert,longest
set foldopen+=insert,jump
set iskeyword+=_
set wildmode=longest:full,full

if system('uname') =~? '^darwin'
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

let g:mapleader = ' '
let g:maplocalleader = '/'

" better escape
noremap jk <esc>
noremap kj <esc>

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" buffer navigation
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprev<CR>
nnoremap <localleader><Tab> :b#<CR>

" center searches
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" better completion
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" using <Cmd> here would ignore the `'<,'>` range
vmap <C-s> :sort<CR>

" paste without overwriting the clipboard
vnoremap <silent> p "_dP

" better indenting
vnoremap < <gv
vnoremap > >gv

" indent/dedent in normal mode with < and >
nnoremap > V`]>
nnoremap < V`]<

" duplicate and comment out line
nmap yc yygccp

" quickly edit the current buffer's ~/.vim/after/ftplugin/.. &ft .. .vim
" nmap <localleader>ft :e ~/.vim/after/ftplugin/<C-R>=&ft<CR>.vim<CR>

nmap <C-c> ciw
nmap <C-s> viW

set tabline=%!ui#tabline()
set statusline=%!ui#statusline()
set showtabline=2
set laststatus=2

augroup autoRestoreCursor
  autocmd!
  autocmd BufReadPost *
        \ let line = line("'\"")
        \ | if line >= 1 && line <= line("$")
        \ |   execute "normal! g`\""
        \ |   execute "silent! normal! zO"
        \ | endif
augroup END

augroup autoMkdir
  autocmd!
  autocmd BufWritePre * call file#automkdir(expand('<afile>'))
augroup END

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow | silent! call ui#qf_signs()
  autocmd QuickFixCmdPost   l*  lwindow | silent! call ui#qf_signs()
augroup END

silent! color scheme

" syntax
" https://stackoverflow.com/a/28399202/26469286
" For files that don't have filetype-specific syntax rules
" autocmd BufNewFile,BufRead *syntax match NotPrintableAscii "[^\x20-\x7F]"
" For files that do have filetype-specific syntax rules
" autocmd Syntax * syntax match NotPrintableAscii "[^\x20-\x7F]" containedin=ALL
" hi NotPrintableAscii ctermbg=236

highlight Evil guifg=red guibg=orange

augroup mySyntax
  autocmd!
  autocmd BufNewFile,BufRead * syntax match Evil /“\|”/
  autocmd Syntax * syntax match Evil /“\|”/
  " highlight error for vim scripts
  autocmd BufReadPost,BufNewFile *.vim  if search('vim9script', 'nw') == 0 | syn match Error /^\s*#.*$/ | endif
augroup END

highlight CommentStringInBackticks guibg=NONE guifg=#39ff14
syntax region CommentStringInBackticks start=/`/ end=/`/ contained containedin=.*Comment

augroup quit_on_q
  autocmd!
  autocmd FileType help,qf,man silent! nnoremap <silent> <buffer> q :<C-U>close<CR>
augroup END

" Quit immediately if we accidentally open a command window
augroup noCmdwin | autocmd! | autocmd CmdwinEnter * quit |  augroup END

call plug#begin()
" Plug 'rdnajac/after'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" only load plugins on certain filetypes
Plug 'lervag/vimtex', { 'for': 'tex' }
call plug#end() " executes `filetype plugin indent on` and `syntax enable`

" vim: ft=vim fdm=marker sw=2 sts=2
