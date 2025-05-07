command! BreakHere call utils#breakHere()
command! ReplaceSelection call utils#replaceSelection()
command! CleanWhitespace call format#whitespace()
nmap <leader>fw <cmd>CleanWhitespace<CR>

nnoremap <M-j> <Cmd>BreakHere<CR>
inoremap <M-j> <Cmd>BreakHere<CR>
vnoremap <C-r> <cmd>ReplaceSelection<CR>

command! QuickFormat call format#buffer()
nnoremap Q <Cmd>QuickFormat<CR>


command! -range SendVisual <line1>,<line2>call ooze#sendvisual()

function! RunAndEchoVar()
  let line = getline('.')
  if line =~ '^\s*\(\k\+\)=.*'
    let var = matchstr(line, '^\s*\zs\k\+\ze=')
    let cmd = matchstr(line, '=\zs.*')
    let result = system('bash -c "'.var.'='.cmd.'; echo \$var"')
    echo var . " = " . substitute(result, '\n\+$', '', '')
  else
    echo "No variable assignment on this line"
  endif
endfunction
nnoremap <localleader>? :call RunAndEchoVar()<CR>
