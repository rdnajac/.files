function! vim#vimrcmarks() abort
    g/§/let c = matchstr(getline('.'), '§\s*\zs.') | if c =~# '^[A-Za-z]$' | execute 'mark ' . c | endif
endfunction
