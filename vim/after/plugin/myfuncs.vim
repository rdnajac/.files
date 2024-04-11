function! FormatBufferSaveAndReload()
    let l:filetype = &filetype
    if l:filetype == 'vim'
        execute "silent !vim -c 'normal gg=G' -c 'wqa' " . expand('%') | edit
    elseif l:filetype == 'c' || l:filetype == 'cpp'
        echo "Formatting c/cpp"
        "execute "silent !clang-format -i " . expand('%') | edit
    elseif l:filetype == 'python'
        echo "Formatting python"
        "execute "silent !autopep8 --in-place " . expand('%') | edit
    elseif l:filetype == 'lua'
        echo "Formatting lua"
        "execute "silent !lua-format -i " . expand('%') | edit
    elseif l:filetype == 'html'
        "execute "silent !pretter --write " . expand('%') | edit
    else
        echo "No formatting available for filetype: " . l:filetype
    endif
endfunction

function! ToggleCursorColumn(...)
  let l:column = get(a:, 1, 81) " Default column number to 81 if not provided
  if &colorcolumn == ""
    execute "set colorcolumn=" . l:column
  else
    set colorcolumn=
  endif
  set cursorcolumn!
endfunction
nnoremap <F4> :call ToggleCursorColumn()<cr>

function! CycleColorschemes()
    let s:colorschemes = [ 'default', 'habamax', 'retrobox',
                \ 'lunaperche', 'wildcharm', 'zaibatsu' ]
    if !exists("s:current")
        let s:current = 0
    endif
    let s:current = (s:current + 1) % len(s:colorschemes)
    execute 'colorscheme ' . s:colorschemes[s:current]
endfunction



