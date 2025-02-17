" make sure these commands run first!
" no Ex mode, instead Q formats and saves
nnoremap Q <nop>
" avoid conflicts with tmux
nnoremap <C-f> <nop>

if has('nvim')
  lua vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
elseif system('uname') =~? '^darwin'
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

set shiftwidth=8
set tabstop=8
set autochdir
set autoread
set autowrite
set completeopt=menuone,noselect,preview
" set noconfirm
set cursorline
set foldopen+=insert,jump
set ignorecase smartcase
set iskeyword+=_
set linebreak breakindent
set mouse=a
set number relativenumber
set numberwidth=2
set pumheight=10
set report=0
set shiftround
set showmatch
set splitbelow splitright
set termguicolors
set timeoutlen=420
set updatetime=69
set whichwrap+=<,>,[,],h,l
set formatoptions-=o
set list

set scrolloff=5
set sidescrolloff=0

set wildmenu
" XXX: keep this!
set wildmode=longest:full,full

set fillchars+=diff:╱,
set fillchars+=eob:\ ,
set fillchars+=fold:\ ,
set fillchars+=foldsep:\ ,
set fillchars+=foldopen:▾,
set fillchars+=foldclose:▸,
set fillchars+=foldsep:│
set fillchars+=stl:\ ,

set listchars=trail:¿,tab:→\    " show trailing whitespace and tabs

augroup noCmdwin
  autocmd!
  autocmd CmdwinEnter * quit
augroup END

augroup FileTypeSettings
  autocmd!
  " set default for all files, then override for specific filetypes
  autocmd FileType *              setlocal sw=2 sts=2   expandtab
  autocmd FileType sh             setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c              setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda       setlocal sw=4 sts=4
  autocmd FileType python         setlocal sw=4 sts=4
  " autocmd FileType tex            setlocal            fdm=syntax
  autocmd FileType vim,lua        setlocal kp=:help
  autocmd FileType vim,lua,sh     setlocal nonumber norelativenumber numberwidth=2
augroup END

" ignored files and directories {{{
set wildignore+=*.o,*.out,*.a,*.so,*.lib,*.bin,*/.git/*,*.swp,*.swo,
set wildignore+=*.pdf,*.aux,*.fdb_latexmk,*.fls " LaTeX files
set wildignore+=*.zip,*.tar.gz,*.rar,*.7z,*.tar.xz,*.tgz " compressed files
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.tiff,*.ico,*.svg,*.webp,*.img
set wildignore+=*.mp*p4,*.avi,*.mkv,*.mov,*.flv,*.wmv,*.webm,*.m4v,*.flac,*.wav
set wildignore+=*.dylib,*.app,*.dmg,*.DS_Store,*.exe,*.dll,*.msi,Thumbs.db
" }}}

" stop pressing shift for cmd
nnoremap ; :
cnoremap ; <CR>
cnoreabbrev ?? verbose set?<Left>
cnoreabbrev !! !./%

vnoremap <C-s> :sort<CR>

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

" indent/dedent in normal mode with < and >
nnoremap > V`]>
nnoremap < V`]<

" paste without overwriting the clipboard
xnoremap <silent> p "_dP
vnoremap <silent> p "_dP

" duplicate and comment out line
nmap yc yygccp

" time abbreviations
ia <expr> DT strftime('%B %d, %Y')
ia <expr> dt strftime('%Y-%m-%d')
ia <expr> tm strftime('%H:%M:%S')
ia <expr> dtm strftime('%Y-%m-%d %H:%M:%S')
ia LR LAST REVISION: <C-R>=strftime('%Y-%m-%d')<CR>

" quickly edit the current buffer's ~/.vim/after/ftplugin/.. &ft .. .vim
nmap <localleader>ft :e ~/.vim/after/ftplugin/<C-R>=&ft<CR>.vim<CR>

" better completion
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" from LazyVim
" add undo break-points (:help i_ctrl-g_u)
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

" better indenting
vnoremap < <gv
vnoremap > >gv

nnoremap ` ~
nnoremap ~ `
" vim: fdm=marker fdl=0
