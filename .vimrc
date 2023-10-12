" general settings
" nvim defaults {{{
if !has('nvim')
set nocompatible
set autoindent smartindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set hidden
set history=10000
set hlsearch incsearch 
set mouse=a
set showcmd
set smarttab
set undodir=~/.vim/undo
set wildmenu
syntax on

endif
" }}}
" shared settings {{{
filetype plugin on
filetype indent on
set whichwrap+=<,>,[,],h,l
set magic
set ignorecase smartcase
set scrolloff=8
set sidescrolloff=8
set nowrap
set lazyredraw
set listchars=trail:~,tab:▸\
set number
set numberwidth=4
set termguicolors
set splitbelow splitright
set mat=2
set foldcolumn=1
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set clipboard=unnamedplus
set undofile
set undolevels=1000
set undoreload=10000
set nobackup nowb noswapfile
set pumheight=10
set showmatch
set timeout timeoutlen=300
set fileformat=unix
set wildmode=list:longest,full
set wildignore=*.o,*.out,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img,
" }}}

" code style [Linux kernel coding style]
set cindent
set shiftwidth=8
set tabstop=8

" keymaps {{{
let mapleader = "\<space>"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" quicksave
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :bp <BAR> bd #<CR>

" better escape
inoremap jk <esc>

" insert blank line without leaving normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader><tab> i<tab><esc>
nnoremap <leader><space> i<space><esc>

" toggle cursor line/column, listchars, and colorcolumn
nnoremap <leader>c :set cursorline! cursorcolumn! list!<cr> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" :"")<cr>

"toggle highlight
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"


" center searches -----------------------------------------------------------{{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" }}}
" }}}
" cool stuff
nnoremap U <C-r> redo
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

" indent/dedent what you just pasted
nnoremap <leader>< V`]<
nnoremap <leader>> V`]>

" Vim GUI stuff ------------------------------------------------------------ {{{
if !has('nvim')
set cmdheight=1
set signcolumn=yes
set background=dark

if  !empty(glob("~/.vim/colors/simple.vim"))	
	colorscheme simple
else
	colorscheme ron
endif

" return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zv" | endif
	
" enable code folding in vim files
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"highlight Folded ctermbg=none

" Buffer Management  {{{
nnoremap <leader>+ <esc>:badd
nnoremap <leader>- <esc>:vs<CR>:bnext<CR>
nnoremap <leader>_ <esc>:sp<CR>:bnext<CR>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nmap <leader>bl :ls<CR>

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" }}}

" statusline {{{

" clear statusline
set statusline=
" git branch
set statusline+=%{FugitiveStatusline()}
" full path 
set statusline+=\ %F\ %M\ %y\ %r
set statusline+=%=
" char values
set statusline+=%=
set statusline+=ascii:\ %3b\ hex:\ 0x%02B\ 
" visual column # and page position
set statusline+=[%2v,\%P]
set laststatus=2
" }}}

" Plugin Settings ---------------------------------------------------------- {{{

" YouCompleteMe
source ~/.files/ycm-config.vim

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" q to close help and man page popups
autocmd FileType help noremap <buffer> q :q<cr>
autocmd FileType man noremap <buffer> q :q<cr>

" ctrl-p
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>e :NERDTreeToggle<CR>  " open and close file tree
nnoremap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree

" }}}

" {{{ Plugins
" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')

" COMS W4118
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

" Extra
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" Colors
Plug 'lifepillar/vim-colortemplate'

" All of your Plugins must be added before the following line
call plug#end()
" }}}
endif

" ChatGPT-gener
augroup AutoOpenFold
    autocmd!
    " Trigger the autocommand when a buffer is read or a window is entered
    autocmd BufWinEnter,BufReadPost * if foldlevel(line('$')) > 0 | normal! zo | endif
augroup END
