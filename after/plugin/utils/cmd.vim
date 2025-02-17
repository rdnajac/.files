" cmdline
lua <<EOF
function GetSnacksTerm()
  MyTerm = Snacks.terminal.toggle()
  vim.g.MyTermChannel = vim.bo[MyTerm.buf].channel
  vim.cmd([[ 
    call chansend(g:MyTermChannel, "tmux new-session -A -s snacks-sesh \n")
    nunmap <c-\>
    nnoremap <c-\> :lua Snacks.terminal.toggle()<CR>
    tnoremap <c-\> :lua Snacks.terminal.toggle()<CR>
    ]])
  end
EOF

let s:newline = "\n"

" Move cursor to next non-empty line
function s:linefeed()
  let i = line(".") + 1
  call cursor(i, 1)
  let curline = substitute(getline("."), '^\s*', "", "")
  let fc = curline[0]
  while i < line("$") && strlen(curline) == 0
    let i = i + 1
    call cursor(i, 1)
    let curline = substitute(getline("."), '^\s*', "", "")
    let fc = curline[0]
  endwhile
endfunction

function! s:scroll()
  let isnormal = mode() ==# 'n'
  let curwin = winnr()
  " Find the nearest terminal window
  for i in range(1, winnr('$'))
    if getbufvar(winbufnr(i), '&buftype') == 'terminal'
      execute i . 'wincmd w'
      call cursor('$', 1)
      break
    endif
  endfor
  " Return to original window
  execute curwin . 'wincmd w'

  if isnormal
    stopinsert
  endif
endfunction

function SendLine()
  if !exists("g:MyTermChannel")
    echoerr "No terminal channel found"
    return
  endif
  let line = getline(".")
  if strlen(line) > 0
    call s:scroll()
    call chansend(g:MyTermChannel, line . s:newline)
  endif
  call s:linefeed()
endfunction

function s:tostring()
  try
    let a_orig = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_orig
  endtry
endfunction

function SendSelection() range
let lines = split(s:tostring(), "\n")
for line in lines
  call chansend(g:MyTermChannel, line . s:newline)
endfor
endfunction

command! GetSnacksTerm lua GetSnacksTerm()
command! SendLine call SendLine()
command! -range SendSelection <line1>,<line2>call SendSelection()

" keymaps
" nnoremap <silent> <c-\> <cmd>GetSnacksTerm<CR>
" nnoremap <silent> <cr> <cmd>SendLine<CR>
" vnoremap <silent> <cr> <cmd>SendSelection<CR>
