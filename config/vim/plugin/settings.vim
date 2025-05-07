set backup
set undofile undolevels=10000

set autowrite
set breakindent
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
set linebreak
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
set timeoutlen=420
set updatetime=69
set whichwrap+=<,>,[,],h,l

set completeopt=menu,preview,preinsert,longest
" set completeopt=menu,preview,longest
set foldopen+=insert,jump
" set iskeyword+=_
set wildmode=longest:full,full

if system('uname') =~? '^darwin'
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

augroup FileTypeSettings
  autocmd!
  autocmd FileType *            setlocal foldmethod=marker
  autocmd FileType sh,zsh       setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c            setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda     setlocal sw=4 sts=4
  autocmd FileType json         setlocal sw=2 sts=2
  autocmd FileType python       setlocal sw=4 sts=4
  autocmd FileType r,rmd,quarto setlocal sw=2 sts=2
  " autocmd FileType tex    setlocal            fdm=syntax
  autocmd FileType vim,lua  setlocal sw=2 sts=2 kp=:help
augroup END
