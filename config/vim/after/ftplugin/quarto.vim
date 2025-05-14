runtime! after/ftplugin/rmd.vim

" TODO: write a template file
inoremap <buffer> --- ---<CR>engine: "knitr"<CR>---<CR><CR>

inoremap <buffer> `b ```{bash}<CR><CR>```<Up>
inoremap <buffer> `p ```{python}<CR><CR>```<Up>
inoremap <buffer> `r ```{r}<CR><CR>```<Up>

hi clear QuartoCodeComment
