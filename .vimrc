" ryan's .vimrc
" under the hood {{{
set nocompatible              " Vim behaves like Vim, not like vi
filetype plugin on            " filetype detection and plugins
filetype indent on            " filetype-specific indentation
set mouse=a                   " Enable mouse in all modes
set clipboard=unnamed         " Use system clipboard
set backspace=indent,eol,start " Configure backspace behavior
set whichwrap+=<,>,[,],h,l    " Configure wrapping for certain keys
set lazyredraw                " Delay redrawing during macro execution
set noerrorbells              " Disable error bells
set novisualbell              " Disable visual bells
set t_vb=                     " Set visual bell pattern to none
set timeout                   " Enable key timeout
set timeoutlen=300            " Set key timeout length

" undo
set hidden                    " Allow hidden buffers
set nobackup                  " Disable backup files
set nowb                      " Disable write backup files
set noswapfile                " Disable swap files
set undofile                  " Enable persistent undo
set undolevels=1000           " Set number of undo levels
set undoreload=10000          " Set number of lines for undo reload

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo       " Set directory for undo files

set undofile
set autoread                  " Automatically reload files when changed externally
" extensions to ignore {{{
set wildignore=*.o,*.out,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img
" }}}
" }}}


" statusline {{{
set statusline=                           " Clear statusline
set statusline+=%{FugitiveStatusline()}   " Git branch
set statusline+=\ %F\ %M\ %y\ %r          " File path, modified flag, file type, read-only flag
set statusline+=%=                        " Right align the following items
set statusline+=ascii:\ %3b\ hex:\ 0x%02B\ " ASCII and hex value of char under cursor
set statusline+=[%2v,\%P]                 " Visual column number and page position
set laststatus=2                          " Always display the statusline
" }}}

" colorscheme {{{
set background=dark           " Set the default background color

if has('patch-8.2.2552')
    colorscheme retrobox
else
    colorscheme default
endif

color retrobox
function! CycleColorschemes()
    let s:colorschemes = [ 'default', 'habamax', 'retrobox', 'lunaperche', 'wildcharm', 'zaibatsu' ]

    if !exists("s:current")
        let s:current = 0
    endif

    let s:current = (s:current + 1) % len(s:colorschemes)
    execute 'colorscheme ' . s:colorschemes[s:current]
endfunction
nnoremap <F5> :call CycleColorschemes()<CR>
" }}}

" display settings {{{
set cmdheight=1               " Set command line height
set nowrap                    " Disable line wrapping
set number                    " Show line numbers
set numberwidth=4             " Set line number column width
set pumheight=10              " Set popup menu height
set scrolloff=8               " Set vertical scroll offset
set showcmd                   " Show incomplete commands
set showmatch                 " Show matching brackets
set sidescrolloff=8           " Set horizontal scroll offset
set signcolumn=yes            " Show sign column
set termguicolors             " Enable true color support
" }}}

" formatting {{{
syntax on                     " Enable syntax highlighting
set encoding=utf-8            " Use UTF-8 as the default encoding
set fileformat=unix           " Set file format to Unix
set listchars=trail:¿,tab:→\  " Show tabs and trailing spaces
set list                      " Enable listchars
set autoindent                " Automatically indent new lines
set smartindent               " Enable smart indentation
set smarttab                  " Insert spaces for tabs
set cindent                   " Enable C-style indentation
set shiftwidth=4              " Set width for auto-indents
set tabstop=4                 " Set tab stop width
set expandtab                 " Convert tabs to spaces
" }}}

" searh and matching {{{
set magic                     " Enable pattern matching features in search
set mat=2                     " Set match timeout
set hlsearch                  " Highlight search results
set incsearch                 " Incremental search
set ignorecase                " Ignore case in search patterns
set smartcase                 " Override ignorecase if search pattern contains uppercase
set wildmenu                  " Enable wildmenu for command completion
set wildmode=list:longest,full " Configure command completion

" Toggle highlight search
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Search and replace word under cursor {{{
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
" }}}

" Center searches {{{
nnoremap n nzz                            " Center cursor after 'n'
nnoremap N Nzz                            " Center cursor after 'N'
nnoremap * *zz                            " Center cursor after '*'
nnoremap # #zz                            " Center cursor after '#'
nnoremap g* g*zz                          " Center cursor after 'g*'
nnoremap g# g#zz                          " Center cursor after 'g#'
nnoremap <C-d> <C-d>zz                    " Center cursor after Ctrl-d
nnoremap <C-u> <C-u>zz                    " Center cursor after Ctrl-u
" }}}
" }}}

" buffers and windows {{{
set splitbelow                " Open new split panes below current pane
set splitright                " Open new split panes to the right of current pane
nnoremap <leader>+ <esc>:badd             " Add new buffer
nnoremap <leader>- <esc>:vs<CR>:bnext<CR> " Vertical split and next buffer
nnoremap <leader>_ <esc>:sp<CR>:bnext<CR> " Horizontal split and next buffer
nnoremap L :bnext<CR>                     " Next buffer
nnoremap H :bprevious<CR>                 " Previous buffer
nmap <leader>bl :ls<CR>                   " List buffers
" }}}

" toggle linux tab rules
" TODO move this to c ftplugin
function! ToggleTabSettings()
  if &tabstop == 4
    set tabstop=8 shiftwidth=8 noexpandtab
  else
    set tabstop=4 shiftwidth=4 expandtab
  endif
endfunction
nnoremap <F2> :call ToggleTabSettings()<CR>

" Keymaps {{{
inoremap jk <esc>                         " Map 'jk' to escape in insert mode
let mapleader = "\<space>"                " Set leader key to space
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  " Edit Vimrc in vertical split
nnoremap <leader>sv :source $MYVIMRC<cr>  " Source Vimrc
nnoremap <leader>q :bp <BAR> bd #<CR>     " Quick buffer close (also closes split)

nnoremap <leader>o o<esc>                 " Insert blank line below without leaving normal mode
nnoremap <leader>O O<esc>                 " Insert blank line above without leaving normal mode
nnoremap <leader><tab> i<tab><esc>        " Insert tab without leaving normal mode
nnoremap <leader><space> i<space><esc>    " Insert space without leaving normal mode
nnoremap <leader>< V`]<       " Indent pasted text
nnoremap <leader>> V`]>       " Dedent pasted text

nnoremap <leader>c :set cursorline! cursorcolumn!<cr> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" :"")<cr> " Toggle cursor line/column

vnoremap <leader>` :s/\%V`\(.*\)`/`&`/<CR> " Replace in visual selection

" quicksave and remove whitespace {{{
function! SaveAndClean()
    let l:save_cursor = getpos(".")
    let l:before_length = join(getline(1,'$'), "\n")
    %s/\s\+$//e " find and replace all whitespace with nothing
    let l:after_length = join(getline(1,'$'), "\n")
    let l:bytes_deleted = strlen(l:before_length) - strlen(l:after_length)
    call setpos('.', l:save_cursor)
    write!
    if l:bytes_deleted > 0
        echohl WarningMsg | echom "Removed trailing whitespace: " . l:bytes_deleted . " byte(s) deleted." | echohl None
    endif
endfunction
nnoremap <leader>w :call SaveAndClean()<CR>
" }}}
" }}}

" Help {{{
" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

function! OpenHelpForSelectedWord()
    let word = expand('<cword>')
    execute 'help ' . word
endfunction

nnoremap ? :call OpenHelpForSelectedWord()<CR>
"vnoremap <leader>h :<C-U>call OpenHelpForSelectedWord()<CR>

autocmd FileType help,man,netrw,quickfix noremap <buffer> q :q<cr> " Close help, man pages, and netrw with 'q'

" }}}

" folding {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zv" | endif
autocmd BufReadPost * if foldclosed('.') != -1 | execute "normal! zv" | endif

" Close completion menu
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"if no buffers after closing a window, close the window

"Plug 'Valloric/YouCompleteMe'
"source ~/.files/ycm-config.vim

" ctrl-p settings
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" netrw {{{
nnoremap <leader>e :Lexplore<CR>
let g:netrw_liststyle = 3
"let g:netrw_banner = 0 " disable banner
let g:netrw_browse_split = 4 " open in previous window
let g:netrw_altv = 1
let g:netrw_winsize = 25

" close if netrw is the only buffer
autocmd bufenter * if winnr("$") == 1 && &filetype == 'netrw' | q | endif

set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" ignore
let g:RootIgnoreAgignore = 1

" cool shit
function! Run(command)
    let l:command = a:command
    let l:tempfile = tempname()
    execute 'silent !'.l:command.' > '.l:tempfile
    execute 'cfile '.l:tempfile
    silent! call delete(l:tempfile)
    copen
    echo "Output of '".l:command."' loaded into quickfix list."
endfunction


