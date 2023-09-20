" General -------------------------------------------------------------- {{{
set nocompatible
set whichwrap+=<,>,[,],h,l
set incsearch magic hlsearch 
set ignorecase smartcase
set scrolloff=8
set sidescrolloff=8
set nowrap
set cmdheight=1
set lazyredraw
set listchars=trail:~,tab:▸\  ",eol:¬
set number
set numberwidth=3
filetype on
filetype plugin on
filetype indent on
set termguicolors
set splitbelow splitright
set hidden
set mouse=a
set mat=2
set foldcolumn=1
set showcmd showmatch
set cmdheight=1
set ruler
set noerrorbells
set novisualbell
set t_vb=
set clipboard=unnamed
set history=10000
set undofile
set undodir=~/.vim/backup
set undoreload=10000
set nobackup nowb noswapfile
set backspace=indent,eol,start
set pumheight=10
set showmatch
set timeout timeoutlen=300
set encoding=utf8
set fileformat=unix
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.out,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img,
" }}}
" code style [Linux kernel coding style]
syntax on
set autoindent smartindent cindent
set shiftwidth=8
set tabstop=8
"set list
"make mapping for `set list!` to see trailing whitepsaces

" kep mappings
let mapleader = "\<space>"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" quicksave
nmap <leader>w :w!<cr>
" better escape
inoremap jk <esc>
" insert blank line without leaving normal mode 
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
" show cursor line and column
nnoremap <leader>c :set cursorline! cursorcolumn!<cr>
"toggle highlight
nnoremap <silent><expr> <Leader>l (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" managing splits and buffers
nnoremap <leader>+ <esc>:badd 
nnoremap <leader>- <esc>:vs<CR>:bnext<CR> 
nnoremap <leader>_ <esc>:sp<CR>:bnext<CR>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif 

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Center searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" neovim
"set modifiable
"signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
"iskeyword:append "-"                    -- treats words with `-` as single words
"formatoptions:remove { "c", "r", "o" }  -- This is a sequence of letters which describes how automatic formatting is to be done

" This will enable code folding in vim files
augroup filetype_vim
    "autocmd!
    "autocmd FileType vim setlocal foldmethod=marker
augroup END

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c

" Show the status on the second to last line.
set laststatus=2

" }}}


" Plugin Settings -------------------------------------------------------------- {{{
" YouCompleteMe
"nmap <leader>] :YcmCompleter GoTo<CR>

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

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
"Plug 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call plug#end()
" }}}
