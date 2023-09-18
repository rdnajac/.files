" general settings
set nocompatible
let mapleader = "\<Space>"
set timeout timeoutlen=300
set history=10000
filetype plugin on
filetype indent on
set backspace=indent,eol,start
whichwrap:append "<,>,[,],h,l"
set nobackup
set nowb
set noswapfile
set encoding=utf8
set magic



" code style
set autoindent
"syntax enable

set expandtab " Use spaces instead of tabs
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4



set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" GUI
set background=dark
set ruler
set lazyredraw
set showmatch
set mat=2
" Add a bit extra margin to the left
set foldcolumn=1

" Height of the command bar
set cmdheight=1
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Buffers
set hidden
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Fast saving
nmap <leader>w :w!<cr>

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set incsearch


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime



" these are defaulted in neovim

" changed from neovim default options

showmode = true                        -- we don't need to see things like -- INSERT -- anymore
" neovim ide settings
backup = false                          -- creates a backup file
clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
cmdheight = 1                           -- more space in the neovim command line for displaying messages
completeopt = { "menuone", "noselect" } -- mostly just for cmp
conceallevel = 0                        -- so that `` is visible in markdown files
fileencoding = "utf-8"                  -- the encoding written to a file
hlsearch = true                         -- highlight all matches on previous search pattern
ignorecase = true                       -- ignore case in search patterns
mouse = "a"                             -- allow the mouse to be used in neovim
pumheight = 10                          -- pop up menu height
showtabline = 0                         -- always show tabs
smartcase = true                        -- smart case
smartindent = true                      -- make indenting smarter again
splitbelow = true                       -- force all horizontal splits to go below current window
splitright = true                       -- force all vertical splits to go to the right of current window
swapfile = false                        -- creates a swapfile
termguicolors = true                    -- set term gui colors (most terminals support this)
undofile = true                         -- enable persistent undo
updatetime = 300                        -- faster completion (4000ms default)
writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
expandtab = true                        -- convert tabs to spaces
shiftwidth = 2                          -- the number of spaces inserted for each indentation
tabstop = 2                             -- insert 2 spaces for a tab
cursorline = true                       -- highlight the current line
number = true                           -- set numbered lines
laststatus = 3                          -- only the last window will always have a status line
showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
ruler = false                           -- hide the line and column number of the cursor position
numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
wrap = false                            -- display lines as one long line
scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
guifont = "monospace:h17"               -- the font used in graphical neovim applications
fillchars.eob = " "                     -- show empty lines at the end of a buffer as ` ` {default `~`}
shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
          -- keys allowed to move to the previous/next line when the beginning/end of line is reached
iskeyword:append "-"                    -- treats words with `-` as single words
formatoptions:remove { "c", "r", "o" }  -- This is a sequence of letters which describes how automatic formatting is to be done
linebreak = true
set exrc
set nohlsearch
set hidden
set noerrorbells
set nowrap
set modifiable
set incsearch
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes

set tabstop=4
set expandtab
set shiftwidth=4
set number
set autoindent
set smartindent
set cindent

nmap <leader>] :YcmCompleter GoTo<CR>

" airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" ctrl-p
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree

" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif 



inoremap jk <Esc>

inoremap <leader>{ {}<left>
inoremap <leader>{<CR> {<CR>}<ESC>O
inoremap <leader>{;<CR> {<CR>};<ESC>O


nnoremap <leader><space> :update<cr>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>c :set cursorline! cursorcolumn!<cr>

" Center searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Toggle pattern highlight
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" untested
set sessionoptions-=options
set viewoptions-=options

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

" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call plug#end()
