"color scheme
color retrobox
" General settings and behavior {{{
set nocompatible              " Ensure Vim behaves like Vim, not like vi
syntax on                     " Enable syntax highlighting
set encoding=utf-8            " Use UTF-8 as the default encoding
set magic                     " Enable pattern matching features in search
set fileformat=unix           " Set file format to Unix
set background=dark           " Set the default background color
set listchars=trail:¿,tab:→\  " Configure listchars for better visibility
set list                      " Enable listchars
" }}}

" Performance and efficiency {{{
set lazyredraw                " Delay redrawing during macro execution
set noerrorbells              " Disable error bells
set novisualbell              " Disable visual bells
set t_vb=                     " Set visual bell pattern to none
set mat=2                     " Set match timeout
set scrolloff=8               " Set vertical scroll offset
set sidescrolloff=8           " Set horizontal scroll offset
set nowrap                    " Disable line wrapping
set clipboard=unnamed         " Use system clipboard
set timeout                   " Enable key timeout
set timeoutlen=300            " Set key timeout length
set termguicolors             " Enable true color support
" }}}

" File and buffer handling {{{
filetype plugin on            " Enable filetype detection and plugins
filetype indent on            " Enable filetype-specific indentation
set hidden                    " Allow hidden buffers
set nobackup                  " Disable backup files
set nowb                      " Disable write backup files
set noswapfile                " Disable swap files
set undofile                  " Enable persistent undo
set undolevels=1000           " Set number of undo levels
set undoreload=10000          " Set number of lines for undo reload
set undodir=~/.vim/undo       " Set directory for undo files
set autoread                  " Automatically reload files when changed externally
" }}}

" User interface and display settings {{{
set number                    " Show line numbers
set numberwidth=4             " Set line number column width
set mouse=a                   " Enable mouse in all modes
set showcmd                   " Show incomplete commands
set showmatch                 " Show matching brackets
set pumheight=10              " Set popup menu height
set signcolumn=yes            " Show sign column
set cmdheight=1               " Set command line height
set wildmenu                  " Enable wildmenu for command completion
set wildmode=list:longest,full " Configure command completion
set splitbelow                " Open new split panes below current pane
set splitright                " Open new split panes to the right of current pane
set whichwrap+=<,>,[,],h,l    " Configure wrapping for certain keys
set wildignore=*.o,*.out,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img
" }}}

" Buffer Management {{{
nnoremap <leader>+ <esc>:badd             " Add new buffer
nnoremap <leader>- <esc>:vs<CR>:bnext<CR> " Vertical split and next buffer
nnoremap <leader>_ <esc>:sp<CR>:bnext<CR> " Horizontal split and next buffer
nnoremap L :bnext<CR>                     " Next buffer
nnoremap H :bprevious<CR>                 " Previous buffer
nmap <leader>bl :ls<CR>                   " List buffers
" }}}

" Statusline config {{{
set statusline=                           " Clear statusline
set statusline+=%{FugitiveStatusline()}   " Git branch
set statusline+=\ %F\ %M\ %y\ %r          " File path, modified flag, file type, read-only flag
set statusline+=%=                        " Right align the following items
set statusline+=ascii:\ %3b\ hex:\ 0x%02B\ " ASCII and hex value of char under cursor
set statusline+=[%2v,\%P]                 " Visual column number and page position
set laststatus=2                          " Always display the statusline
" }}}

" Editing and indentation settings {{{
set autoindent                " Automatically indent new lines
set smartindent               " Enable smart indentation
set backspace=indent,eol,start " Configure backspace behavior
set smarttab                  " Insert spaces for tabs
set cindent                   " Enable C-style indentation
set shiftwidth=4              " Set width for auto-indents
set tabstop=4                 " Set tab stop width
set expandtab                 " Convert tabs to spaces

nnoremap <leader>< V`]<       " Indent pasted text
nnoremap <leader>> V`]>       " Dedent pasted text

function! ToggleTabSettings()
  if &tabstop == 4
    set tabstop=8 shiftwidth=8 noexpandtab
  else
    set tabstop=4 shiftwidth=4 expandtab
  endif
endfunction
nnoremap <F2> :call ToggleTabSettings()<CR> " Map F2 to toggle tab settings
" }}}

" Search and matching {{{
set hlsearch                  " Highlight search results
set incsearch                 " Incremental search
set ignorecase                " Ignore case in search patterns
set smartcase                 " Override ignorecase if search pattern contains uppercase

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

" Keymaps {{{
inoremap jk <esc>                         " Map 'jk' to escape in insert mode
let mapleader = "\<space>"                " Set leader key to space
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  " Edit Vimrc in vertical split
nnoremap <leader>sv :source $MYVIMRC<cr>  " Source Vimrc
nnoremap <leader>w :w!<cr>                " Quick save
nnoremap <leader>q :bp <BAR> bd #<CR>     " Quick buffer close
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> " Remove trailing whitespace

nnoremap <leader>o o<esc>                 " Insert blank line below without leaving normal mode
nnoremap <leader>O O<esc>                 " Insert blank line above without leaving normal mode
nnoremap <leader><tab> i<tab><esc>        " Insert tab without leaving normal mode
nnoremap <leader><space> i<space><esc>    " Insert space without leaving normal mode

nnoremap <leader>c :set cursorline! cursorcolumn!<cr> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" :"")<cr> " Toggle cursor line/column

vnoremap <leader>` :s/\%V`\(.*\)`/`&`/<CR> " Replace in visual selection

" Help {{{
" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

function! OpenHelpForSelectedWord()
    let word = expand('<cword>')
    execute 'help ' . word
endfunction

"vnoremap <leader>h :<C-U>call OpenHelpForSelectedWord()<CR> " Open help for visual selection
nnoremap ? :call OpenHelpForSelectedWord()<CR>       " Open help for word under cursor
autocmd FileType help noremap <buffer> q :q<cr>             " Close help and man pages with 'q'
autocmd FileType man noremap <buffer> q :q<cr>
" }}}
" }}}

" Vim autocommands {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zv" | endif
autocmd BufReadPost * if foldclosed('.') != -1 | execute "normal! zv" | endif


" Close completion meun
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" }}}

" Plugins {{{
" Automatically download vim-plug if not found
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
Plug 'tpope/vim-surround'

Plug 'lervag/vimtex'

call plug#end()
" }}}

" Plugin Settings {{{
" YouCompleteMe settings
source ~/.files/ycm-config.vim

" ctrl-p settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " Enter file search mode

" Nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>e :NERDTreeToggle<CR>  " Open and close file tree
nnoremap <leader>n :NERDTreeFind<CR>    " Open current buffer in file tree
" }}}

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_compiler_method = 'latexrun'

set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 37be36cc7cf43230342e27f9c19099b6 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/rdn/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
