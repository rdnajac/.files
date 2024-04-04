" my minimal statusline

" clear the statusline so we can start fresh
set statusline=
set statusline+=%{FugitiveStatusline()}   " Git branch
    set statusline+=\ %F\ %M\ %y\ %r          " File path, modified flag, file type, read-only flag
    set statusline+=%=                        " Right align the following items
    " TODO make this only show in certain filetypes
    set statusline+=ascii:\ %3b\ hex:\ 0x%02B\ " ASCII and hex value of char under cursor
    set statusline+=[%2v,\%P]  
