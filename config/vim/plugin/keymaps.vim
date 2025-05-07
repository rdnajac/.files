
nnoremap <localleader>v :e $MYVIMRC<CR>
nnoremap <localleader>R :source $MYVIMRC<CR>

" using <Cmd> here would ignore the `'<,'>` range
vmap <M-s> :sort<CR>

" paste/delete without overwriting the register
vnoremap <silent> p "_dP
vnoremap <silent> <leader>d p"_d
vnoremap <silent> <leader>p "_dP

" indent/dedent in normal mode with < and >
nnoremap > V`]>
nnoremap < V`]<

" better indenting
vnoremap < <gv
vnoremap > >gv

" duplicate and comment out line
nmap yc yygccp

" quickly edit the current buffer's ~/.vim/after/ftplugin/.. &ft .. .vim
nmap <leader>ft :e ~/.config/vim/after/ftplugin/<C-R>=&ft<CR>.vim<CR>

nmap <C-c> ciw
nmap <C-s> viW

map <silent> <C-q> <Cmd>bd<CR>

" insert mode
iabbrev n- –
iabbrev m- —

" add undo break-points (`:help i_ctrl-g`)
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

cnoreabbrev !! !./%
cnoreabbrev ?? verbose set?<Left>
" TODO: rewrite as a command in lua and notify
cnoreabbrev <expr> L getcmdtype() == ':' && getcmdline() ==# 'L' ? '<c-r><c-l>' : 'L'

" creating a command is less problematic than a cmdline abbreviation
command! Wq wqa!

nnoremap <leader>A :normal! ggVG<CR>
