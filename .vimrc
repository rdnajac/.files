" General settings
" Defaulted in nvim {{{
if !has('nvim')
set nocompatible
set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf8
set hidden
set history=10000
set hlsearch incsearch 
set mouse=a
set showcmd
set smarttab
set undodir=~/.vim/undo
set wildmenu

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif
endif
" }}}
filetype plugin on
filetype indent on
set whichwrap+=<,>,[,],h,l
set magic
set ignorecase smartcase
set scrolloff=8
set sidescrolloff=8
set nowrap
set lazyredraw
set listchars=trail:~,tab:▸\  ",eol:¬
set number
set numberwidth=3
set termguicolors
set splitbelow splitright
set mat=2
set foldcolumn=1
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set clipboard=unnamed
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

" code style [Linux kernel coding style]
"syntax on
set smartindent cindent
set shiftwidth=8
set tabstop=8
"set list
"make mapping for `set list! and cursor column` to see trailing whitepsaces


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

" toggle cursor line and column
nnoremap <leader>c :set cursorline! cursorcolumn!<cr>

"toggle highlight
nnoremap <silent><expr> <Leader>l (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" managing splits and buffers {{{
nnoremap <leader>+ <esc>:badd
nnoremap <leader>- <esc>:vs<CR>:bnext<CR>
nnoremap <leader>_ <esc>:sp<CR>:bnext<CR>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Specify the behavior when swtching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}
" Center searches -----------------------------------------------------------{{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" }}}
" GUI stuff ------------------------------------------------------------ {{{
set cmdheight=1
set showtabline=0
set signcolumn=auto

" Set column guide to 80 + 1 for the bar itself.
"if exists('+colorcolumn')
"  set colorcolumn=81
"else
"   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
"endif

"autocmd BufWritePre * %s/\s\+$//e
"}}}

if !has('nvim')
" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Vim-only settings  ------------------------------------------------------- {{{
colorscheme simple

" This will enable code folding in vim files
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
highlight Folded ctermbg=none

" q to close help and man page popups
autocmd FileType help noremap <buffer> q :q<cr>
autocmd FileType man noremap <buffer> q :q<cr>

" }}}

" Vim statuline config ----------------------------------------------------- {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %v\ %P

" Show the status on the second to last line.
set laststatus=2

" }}}

" Plugin Settings ---------------------------------------------------------- {{{

" YouCompleteMe
nnoremap <leader>] :YcmCompleter GoTo<CR>
" Modify below if you want less invasive semantic auto-complete
let g:ycm_semantic_triggers = {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \ }

let g:ycm_complete_in_comments_and_strings = 1
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

set completeopt-=preview

" Optionally suppress all error messages generated by YCM:
" let g:ycm_show_diagnostics_ui=0

" Optionally remove automatic identifier-based completion:
" let g:ycm_min_num_of_chars_for_completion = 99

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colors
Plug 'lifepillar/vim-colortemplate'

" All of your Plugins must be added before the following line
call plug#end()
" }}}
endif
