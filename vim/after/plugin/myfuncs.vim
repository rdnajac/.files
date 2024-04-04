" vim functions mapped to function keys
" vim: set ft=vim: set foldmethod=syntax:


function! GetInfo()
    let l:word = expand('<cword>')
    try
        execute "tag " . l:word
    catch
        try
            execute "help " . l:word
        catch
            try
                execute "Man " . l:word
            catch
                echo "no info found for " . l:word
            endtry
        endtry
    endtry
endfunction
noremap <F1> :call GetInfo()<CR>


" Function: RemoveTrailingWhitespaceAndSave()
" ==============================================================================
" Description: Removes trailing whitespace from the current buffer and saves it.
" Keymap: <F2> (normal mode)
" ==============================================================================
function! RemoveTrailingWhitespaceAndSave()
  let l:save_cursor = getpos(".")
  let l:before_length = join(getline(1,'$'), "\n")
  %s/\s\+$//e
  let l:after_length = join(getline(1,'$'), "\n")
  let l:bytes_deleted = strlen(l:before_length) - strlen(l:after_length)
  call setpos('.', l:save_cursor)
  write!
  if l:bytes_deleted > 0
    echohl WarningMsg | echom "Removed trailing whitespace: " . l:bytes_deleted . " byte(s) deleted." | echohl None
  endif
endfunction
nnoremap <F2> :call RemoveTrailingWhitespaceAndSave()<CR>

" ==============================================================================
" Function: FormatBufferSaveAndReload()
" Description: Formats the current buffer using an external program depending
" on filetype and saves, then reloads the buffer.
" Keymap: <F3> (normal mode)
" ==============================================================================
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

function! ToggleTabSettings()
    if &l:tabstop == 4
        setlocal tabstop=8 shiftwidth=8 noexpandtab
    else
        setlocal tabstop=4 shiftwidth=4 expandtab
    endif
endfunction

function! CycleColorschemes()
    let s:colorschemes = [ 'default', 'habamax', 'retrobox',
                \ 'lunaperche', 'wildcharm', 'zaibatsu' ]
    if !exists("s:current")
        let s:current = 0
    endif
    let s:current = (s:current + 1) % len(s:colorschemes)
    execute 'colorscheme ' . s:colorschemes[s:current]
endfunction
nnoremap <F6> :call CycleColorschemes()<CR>

" ==============================================================================
" Function: NewCHeader()
" Description: Creates a new C header file.
" Usage: :call NewCHeader('filename')
" ==============================================================================
function! NewCHeader(filename)
    let headerFilename = a:filename . ".h"
    let capsFilename = toupper(a:filename)
    let content = ["#ifndef _" . capsFilename . "_H", "#define _" . capsFilename . "_H", "", "#endif /* _" . capsFilename . "_H */"]
    call writefile(content, headerFilename)
    echo "header file created: " . headerFilename
endfunction

function! F1()
    " call getinfo
endfunction
