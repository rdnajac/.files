set timeout timeoutlen=300

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

let mapleader = "\<Space>"

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


" Allow vim to increment/decrement letters with ctrl a/x
set nrformats+=alpha

syntax on                                                                                        
colorscheme ron

set backspace=indent,eol,start


inoremap jk <Esc>
inoremap <leader><space> <Esc>:update<cr>gi
inoremap <leader>a <Esc>la
inoremap <leader>A <Esc>A
inoremap <S-Tab> <C-V><Tab>

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

