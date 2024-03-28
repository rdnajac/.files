" ryan's .vimrc
" if this file is sourced, settings may within folds
" under the hood {{{1
filetype plugin indent on

" performance tweaks {{{2
set timeoutlen=300
set updatetime=100
set lazyredraw
set scrolloff=4 sidescrolloff=1
set whichwrap+=<,>,[,],h,l
set foldopen+=insert,jump

" vim settings that are default in neovim {{{2
if !has("nvim")
    syntax enable                   " prefer `:syntax enable` over `:syntax on
    set autoindent smarttab         " enable auto-indent and smart tabbing
    set autoread                    " auto reload files when changed outside of vim
    set backspace=indent,eol,start  " backspace behavior
    set encoding=utf-8              " nvim default is utf-8
    set formatoptions+=j            " delete comment character when joining lines
    set hidden                      " enable background buffers
    set hlsearch incsearch          " highlighted, incremental search
    set mouse=a                     " enable mouse in all modes
    set nocompatible                " vim behaves like vim, not like vi
    set noerrorbells novisualbell   " disable error bells and visual bells
    set wildmenu wildmode=longest:full,full
    if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man'
        runtime ftplugin/man.vim
    endif
endif
" editor behavior {{{2
set shiftwidth=4
set tabstop=4
set expandtab
set fillchars+=eob:\                " don't show end of buffer as a column of ~
set fillchars+=stl:\                " display spaces properly in statusline
set list listchars=trail:¿,tab:→\   " show trailing whitspace and tabs
set nowrap linebreak                " no wrapping, but break lines appropriately if we do
" searh and matching {{{3
set ignorecase smartcase
"set matchtime=2  " default is 5
set iskeyword+=-  " treat hyphens as part of a word
"set iskeyword+=_  " treat underscores as part of a word
" display settings {{{2
set background=dark termguicolors
set completeopt=menuone,noselect
set cursorline
set number numberwidth=3
set pumheight=10
set showcmd cmdheight=1
set showmatch
set signcolumn=yes
set splitbelow splitright
if has('nvim')
    set noshowmode      " disable showmode
    set noshowcmd       " disable showcmd
    set noruler         " disable ruler
    set laststatus=3    " statusline option for nvim
else
    " not every version has retrobox
    if has('patch-8.2.2552')
        colorscheme retrobox
    endif
    " build our own statusline! {{{3
    set laststatus=2                          " Always display the statusline
    set statusline=                           " Clear statusline
    " TODO: skip fugitive if not installed
    set statusline+=%{FugitiveStatusline()}   " Git branch
    set statusline+=\ %F\ %M\ %y\ %r          " File path, modified flag, file type, read-only flag
    set statusline+=%=                        " Right align the following items
    " TODO make this only show in certain filetypes
    set statusline+=ascii:\ %3b\ hex:\ 0x%02B\ " ASCII and hex value of char under cursor
    set statusline+=[%2v,\%P]                 " Visual column number and page position
    " }}}
endif
" }}}
" use an undofile instead of a swapfile {{{2
set undofile noswapfile
set undolevels=1000
set undoreload=10000
if !has('nvim')
    let g:undo_dir = $HOME . "/.vim/.undo"
    if !isdirectory(g:undo_dir)
        call mkdir(g:undo_dir, "p", 0700)
    endif
    execute "set undodir=" . g:undo_dir
endif
" use the system clipboard {{{2
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    elseif has('unnamed')
        set clipboard=unnamed
    endif
endif
" ignore these files and folders {{{2
set wildignore+=
            \*.exe,*.out,*.cm*,*.o,*.a,*.so,*.dll,*.dylib,*.lib,*.bin,*.app,*.apk,*.dmg,*.iso,*.msi,*.deb,*.rpm,*.pkg,
            \*.class,*.jar,*.pyo,*.pyd,*.node,*.swp,*.swo,*.tmp,*.temp,*.DS_Store,Thumbs.db,
            \*/.git/*,*/.hg/*,*/.svn/*,
            \*.pdf,*.aux,*.fdb_latexmk,*.fls,
            \*.jpg,*.png,*.gif,*.bmp,*.tiff,*.ico,*.svg,*.webp,*.img,
            \*.mp3,*.mp4,*.avi,*.mkv,*.mov,*.flv,*.wmv,*.webm,*.m4v,*.flac,*.wav,
            \*.zip,*.tar.gz,*.rar,*.7z,*.tar.xz,*.tgz,
            \*/node_modules/*,*/vendor/*,*/build/*,*/dist/*,*/out/*,*/bin/*,*/.vscode/*,*/__pycache__/*,*/.cache/*

" }}}

" keymaps {{{1
let mapleader = "\<space>"

" note on reserved mappings {{{2
" the following keymaps are reserved for neovim mappings:
" `<leaader>g` - git
" `<leaader>l` - lsp

" normal mode keymaps {{{2
" toggle highlight search
" TODO add this to which-key
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" courtesy of learn vim the hard way {{{3
"unmap <up> <down> <left> <right>
inoremap jk <esc>
vnoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"}}}

"nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :bp <BAR> bd #<CR>
nnoremap <leader>Q :qa!<cr>
"nnoremap <leader>l :set list!<cr>

nnoremap <leader>o o<esc>                 " Insert blank line below without leaving normal mode
nnoremap <leader>O O<esc>                 " Insert blank line above without leaving normal mode
nnoremap <leader><tab> i<tab><esc>        " Insert tab without leaving normal mode
nnoremap <leader><space> i<space><esc>    " Insert space without leaving normal mode

nnoremap <leader>< V`]<       " Indent pasted text
nnoremap <leader>> V`]>       " Dedent pasted text

vnoremap <leader>` :s/\%V`\(.*\)`/`&`/<CR> " Replace in visual selection

" TODO test move text up and down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
"keymap("n", "<a-j>", "<esc>:m .+1<cr>==gi", opts) -- Alt-j
"keymap("n", "<a-k>", "<esc>:m .-2<cr>==gi", opts) -- Alt-k

" buffers and windows {{{2
" buffer navigation {{{3
nnoremap <leader>vs :vs<CR>
nnoremap <leader>sp :sp<CR>
nnoremap <leader>- <esc>:vs<CR>:bnext<CR>
nnoremap <leader>_ <esc>:sp<CR>:bnext<CR>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bl :ls<CR>
" switch between windows using ctrl {{{3
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
" navigate in terminal mode {{{3
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l
" search and replace {{{2
" center searches {{{3
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" find and replace word under cursor {{{3
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
" visual and visual block {{{2
vnoremap < <gv
vnoremap > >gv

" move selected block of text up and down
xnoremap <silent> J :move '>+1<CR>gv-gv
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> <A-j> :move '>+1<CR>gv-gv
xnoremap <silent> <A-k> :move '<-2<CR>gv-gv
" paste without replacing clipboard
xnoremap <silent> p "_dP


" functions {{{1
" ==============================================================================
" Function: ToggleCursorColumn()
" Description: Toggles the cursor column. Takes an optional argument to set the
"             column number.
" Usage: :call ToggleCursorColumn(80)
" Keymap: <F4> (normal mode)
" ==============================================================================
function! ToggleCursorColumn(...)
  let l:column = get(a:, 1, 81) " Default column number to 81 if not provided
  if &colorcolumn == ""
    execute "set colorcolumn=" . l:column
  else
    set colorcolumn=
  endif
  set cursorcolumn!
endfunction
nnoremap <F4> :call ToggleCursorColumn()<cr>

" ==============================================================================
" Function: GetInfo()
" Description: Displays information about the word under the cursor.
" Usage: :call GetInfo()
" Keymap: ? (normal mode)
" ==============================================================================
function! GetInfo()
    let l:word = expand('<cword>')
    try
        execute "tag " . l:word
    catch
        try
            execute "help " . l:word
        catch
            try
                execute "Man " . l:word
            catch
                echo "no info found for " . l:word
            endtry
        endtry
    endtry
endfunction
nnoremap ? :call GetInfo()<CR>

" ==============================================================================
" Function: RemoveTrailingWhitespaceAndSave()
" Description: Removes trailing whitespace from the current buffer and saves it.
" Usage: :call RemoveTrailingWhitespaceAndSave()
" Keymap: <F2> (normal mode)
" ==============================================================================
function! RemoveTrailingWhitespaceAndSave()
    let l:save_cursor = getpos(".")
    let l:before_length = join(getline(1,'$'), "\n")
    %s/\s\+$//e
    let l:after_length = join(getline(1,'$'), "\n")
    let l:bytes_deleted = strlen(l:before_length) - strlen(l:after_length)
    call setpos('.', l:save_cursor)
    write!
    if l:bytes_deleted > 0
        echohl WarningMsg | echom "Removed trailing whitespace: " . l:bytes_deleted . " byte(s) deleted." | echohl None
    endif
endfunction
nnoremap <F2> :call RemoveTrailingWhitespaceAndSave()<CR>

" ==============================================================================
" Function: ToggleTabSettings()
" Description: Toggles between tab settings for C, C++, and Make files.
" Usage: :call ToggleTabSettings()
" Keymap: <F3> (normal mode)
" ==============================================================================
function! ToggleTabSettings()
    if &l:tabstop == 4
        setlocal tabstop=8 shiftwidth=8 noexpandtab
    else
        setlocal tabstop=4 shiftwidth=4 expandtab
    endif
endfunction
nnoremap <F3> :call ToggleTabSettings()<CR>

" ==============================================================================
" Function: CycleColorschemes()
" Description: Cycles through a list of colorschemes.
" Usage: :call CycleColorschemes()
" Keymap: <F5> (normal mode)
" ==============================================================================
function! CycleColorschemes()
    let s:colorschemes = [ 'default', 'habamax', 'retrobox', 'lunaperche', 'wildcharm', 'zaibatsu' ]
    if !exists("s:current")
        let s:current = 0
    endif
    let s:current = (s:current + 1) % len(s:colorschemes)
    execute 'colorscheme ' . s:colorschemes[s:current]
endfunction
nnoremap <F5> :call CycleColorschemes()<CR>

" ==============================================================================
" Function: NewCHeader()
" Description: Creates a new C header file.
" Usage: :call NewCHeader('filename')
" ==============================================================================
function! NewCHeader(filename)
    let headerFilename = a:filename . ".h"
    let capsFilename = toupper(a:filename)
    let content = ["#ifndef _" . capsFilename . "_H", "#define _" . capsFilename . "_H", "", "#endif /* _" . capsFilename . "_H */"]
    call writefile(content, headerFilename)
    echo "header file created: " . headerFilename
endfunction

" autocommands {{{1
augroup myautocmds
    autocmd!

    " move to last cursor position when opening a file
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"zv" | endif

    " close certain buffers with just `q`
    autocmd FileType help,man,netrw,quickfix,git,lspinfo silent! nnoremap <silent> <buffer> q :close<CR> | set nobuflisted

    " enable word wrapping and spell checking
    autocmd FileType text,gitcommit,markdown,NeogitCommitMessage setlocal wrap spell

    " tab settings for c cpp and make
    autocmd FileType c setlocal cindent noet ts=8 sw=8
    autocmd FileType cpp setlocal cindent et ts=4 sw=4
    autocmd FileType make setlocal noet ts=8 sw=8

    " TODO did I delete this from autocmds.lua?
    " autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

    " line folding
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType tex setlocal foldmethod=marker foldmarker={{{,}}}

augroup END
" }}}

" vim plugin settings {{{1
let g:netrw_banner = 0
if !has("nvim")
    nnoremap <leader>e :Lexplore<CR>
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4 " open in previous window
    let g:netrw_altv = 1
    let g:netrw_winsize = 15
    autocmd bufenter * if winnr("$") == 1 && &filetype == 'netrw' | q | endif
endif

if exists(':CtrlP')
    let g:ctrlp_working_path_mode = 'ra'
endif

if exists(':UltiSnips')
    let g:UltiSnipsSnippetDirectories   =[$HOME.'/.vim/UltiSnips']
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
endif

if exists(':VimtexInverseSearch')
    let g:vimtex_view_method='skim'
endif

if exists(':ycm')
"set completeopt-=preview
"nnoremap <leader>] :YcmCompleter GoTo<CR>
"nnoremap ? <plug>(YCMHover)
let g:ycm_clangd_args = [ '--header-insertion=never' ]

let g:ycm_enable_semantic_highlighting=1
let MY_YCM_HIGHLIGHT_GROUP = {
      \   'typeParameter': 'PreProc',
      \   'parameter': 'Normal',
      \   'variable': 'Normal',
      \   'property': 'Normal',
      \   'enumMember': 'Normal',
      \   'event': 'Special',
      \   'member': 'Normal',
      \   'method': 'Normal',
      \   'class': 'Special',
      \   'namespace': 'Special',
      \ }

for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
  call prop_type_add( 'YCM_HL_' . tokenType,
                    \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
endfor

"let g:ycm_enable_inlay_hints=1
" Modify below if you want less invasive semantic auto-complete
let g:ycm_semantic_triggers = {
    \   'c,objc' : ['->', '.'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \ }

let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui=0
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:ycm_min_num_of_chars_for_completion = 99
endif
