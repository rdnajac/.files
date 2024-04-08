" F1 to get help
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
