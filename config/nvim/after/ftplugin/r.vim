" Insert the R assignment operator with `ctrl + _`
inoremap <buffer> <C-_> <-<Space>
" Insert the R pipe operator with `ctrl + \`
inoremap <buffer> <C-\> <bar>><Space>
" Note that not all terminals handle these key presses the same way

" snippets
inoremap <buffer> ins<Tab> renv::install("")<Left><Left>
inoremap <buffer> lib<Tab> library()<Left>
