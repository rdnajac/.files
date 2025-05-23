runtime! after/ftplugin/rmd.vim

setlocal noautoindent
setlocal formatexpr=
" let &l:formatprg = "/Users/rdn/.config/vim/formatters/quarto.sh"
let &l:formatprg = "Rscript --vanilla -e \"suppressMessages(cat(styler::style_text(readLines('stdin'), style = styler:::tidyverse_qmd())))\""

" TODO: write a template file
inoremap <buffer> --- ---<CR>engine: "knitr"<CR>---<CR><CR>

inoremap <buffer> `b ```{bash}<CR><CR>```<Up>
inoremap <buffer> `p ```{python}<CR><CR>```<Up>
inoremap <buffer> `r ```{r}<CR><CR>```<Up>
