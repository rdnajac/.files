" Note that not all terminals handle these key presses the same way
inoremap <buffer> <M--> <-<Space>
inoremap <buffer> <M-Bslash> <bar>><Space>

inoremap <buffer> ins<Tab> renv::install("")<Left><Left>
inoremap <buffer> lib<Tab> library()<Left>
