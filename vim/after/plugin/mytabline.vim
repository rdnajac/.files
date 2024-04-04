" my minimal tabline
function! Mytabline()
    let s = ''
    for bufnr in filter(range(1, bufnr('$')), 'buflisted(v:val)')
        let s .= '%' . bufnr . 'T'
        let s .= bufnr == bufnr('%') ? '%#TabLineSel#' : '%#TabLine#'
        let s .= getbufvar(bufnr, "&mod") ? '  📝' : '  💾'
        let s .= bufname(bufnr)!= '' ? fnamemodify(bufname(bufnr), ':t') : '[∅]'
    endfor
    let s .= '%#TabLineFill#%T'
    return s
endfunction
set tabline=%!Mytabline()
set showtabline=2
