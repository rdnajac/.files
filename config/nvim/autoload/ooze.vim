if exists('g:autoloaded_ooze') || !has('nvim')
  finish
endif
let g:autoloaded_ooze = 1

let s:newline = "\n"

function! s:scroll() abort
  for bufnr in range(1, bufnr('$'))
    if getbufvar(bufnr, '&buftype') == 'terminal' && getbufvar(bufnr, '&channel') == g:MyTermChannel
      for win_id in nvim_list_wins()
        if nvim_win_get_buf(win_id) == bufnr
          let line_count = nvim_buf_line_count(bufnr)
          call nvim_win_set_cursor(win_id, [line_count, 0])
        endif
      endfor
      break
    endif
  endfor
endfunction

function! ooze#send(text) abort
  if g:ooze_auto_exec
    let text = a:text . s:newline
  endif
  call chansend(g:MyTermChannel, text)
  if g:ooze_auto_scroll | call s:scroll() | endif
endfunction

function! ooze#linefeed() abort
  " TODO: skip comments
  let i = line(".")
  while i < line("$")
    let curline = substitute(getline(i + 1), '^\s*', "", "")
    if strlen(curline) > 0
      call cursor(i + 1, 1)
      return
    endif
    let i = i + 1
  endwhile
endfunction

function! ooze#sendline() abort
  let line = getline(".")
  if strlen(line) > 0
    call s:ooze(line)
  endif
endfunction

function! s:tostring()
  try
    let a_orig = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_orig
  endtry
endfunction

function! ooze#sendvisual() range
  let lines = split(s:tostring(), s:newline)
  for line in lines
    call s:ooze(line)
  endfor
endfunction

function! ooze#runfile() abort
  let l:file = expand('%:p')
  call s:ooze(l:file)
endfunction
