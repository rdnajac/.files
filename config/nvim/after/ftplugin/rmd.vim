runtime! after/ftplugin/r.vim

" inoremap <buffer> `` <Cmd>lua require('util.chunk').insert('r')<CR>
inoremap <buffer> `` ```{r}<CR><CR>```<Up>
