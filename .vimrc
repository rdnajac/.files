" General -------------------------------------------------------------- {{{
set nocompatible
let mapleader = "\<Space>"
filetype on
filetype plugin on
filetype indent on
set timeout timeoutlen=300
set history=10000
set mouse = "a"
set backspace=indent,eol,start
set clipboard=unnamed
set whichwrap+=<,>,[,],h,l
set nobackup nowb noswapfile
set encoding=utf8
set fileformat=unix
set magic
set splitbelow splitright
set wildmenu
set wildmode=list:longest
" }}}


" Code Style ------------------------------------------------------------ {{{
"syntax enable
set shiftwidth=8
set tabstop=8
set autoindent smartindent cindent
set listchars=trail:~,tab:▸\  ",eol:¬
"set list
"make mapping for `set list!`
set number
set nowrap
" }}}

" Editing ------------------------------------------------------------ {{{
set undodir=~/.vim/backup
set undofile
set undoreload=10000
nmap <leader>w :w!<cr>
inoremap jk <Esc>
nnoremap <leader><space> :update<cr>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>c :set cursorline! cursorcolumn!<cr>
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" }}}

" GUI
set termguicolors
set background=dark
set ruler
set scrolloff=8
set sidescrolloff=8
set lazyredraw
set showmatch
set mat=2
set foldcolumn=1
set cmdheight=1
set laststatus=3
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" do I want these?
set showcmd
set cmdheight=1
set showmode
set showmatch

" Buffers
set hidden
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif 

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Ignore compiled files
set wildignore=*.o,*.out,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img,

" searching
set hlsearch incsearch
set ignorecase smartcase
" Center searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" untested
set sessionoptions-=options
set viewoptions-=options

" neovim
"set pumheight=10
"set showtabline
"set updatetime=300
"set modifiable
"set signcolumncursorline
"laststatus = 3                          -- only the last window will always have a status line
"showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
"numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
"signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
"guifont = "monospace:h17"               -- the font used in graphical neovim applications
"shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
"iskeyword:append "-"                    -- treats words with `-` as single words
"formatoptions:remove { "c", "r", "o" }  -- This is a sequence of letters which describes how automatic formatting is to be done
"linebreak = true

" VIMSCRIPT -------------------------------------------------------------- {{{
" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" Display cursorline ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.c :call CleanExtraSpaces()
endif

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif
" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
"set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
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
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"map <C-n> :NERDTreeToggle<CR>  " open and close file tree
"nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree

" }}}

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

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
