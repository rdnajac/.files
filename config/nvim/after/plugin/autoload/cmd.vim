
" Move cursor to next non-empty line
function cmd#linefeed()
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

function! cmd#scroll()
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
