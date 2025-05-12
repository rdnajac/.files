" vim-surround {{{
" Comment-out and duplicate lines
nmap yc yygccp
" TODO: use a register
" nmap yc "ayygccp

vnoremap `  S`
vnoremap b  Sb
nnoremap S  viWS
nnoremap yss ys_

" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

