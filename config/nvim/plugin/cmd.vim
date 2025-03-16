" config/nvim/plugin/cmd.vim

let s:newline = "\n"

function s:linefeed() " {{{
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
" }}}

function! s:scroll() " {{{
  let isnormal = mode() ==# 'n'
  let curwin = winnr()

  " Find the window containing the buffer with our terminal channel
  for i in range(1, winnr('$'))
    let bufnr = winbufnr(i)
    if getbufvar(bufnr, '&buftype') == 'terminal' && getbufvar(bufnr, '&channel') == g:MyTermChannel
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
" }}}

function s:mychansend(text) abort
  if !exists('g:MyTermChannel')
    echoerr "No terminal channel found"
    return
  endif
  if g:cmd_auto_scroll
    call s:scroll()
  endif
  call chansend(g:MyTermChannel, a:text)
  if g:cmd_auto_advance
    call s:linefeed()
  endif
endfunction

function SendLine()
  let line = getline(".")
  if strlen(line) > 0
    call s:mychansend(line . s:newline)
  endif
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
    " TODO: check if we have the var
    call chansend(g:MyTermChannel, line . s:newline)
    " call s:mychansend(line . s:newline)
  endfor
endfunction

function RunFile() abort
  " get the full, absolute path of the current file
  let l:file = expand('%:p')
  call s:mychansend(l:file . s:newline)
endfunction

command! SendLine call SendLine()
command! -range SendSelection <line1>,<line2>call SendSelection()
command! RunFile call RunFile()

" keymaps
nnoremap <silent> ,. <cmd>SendLine<CR>
vnoremap <silent> <cr> <cmd>SendSelection<CR>
nnoremap <silent> ,<cr> <cmd>RunFile<CR>

" augroup MyTerminal
"   autocmd!
"   autocmd Filetype sh,markdown nnoremap <silent> <cr> <cmd>SendLine<CR>
" augroup END

function! MapCR()
  if exists('g:cmd_send_on_enter') && g:cmd_send_on_enter == 1
    call SendLine()
    return ''
  else
    return "\<CR>"
  endif
endfunction

nnoremap <expr> <CR> MapCR()

" vim: set fdm=marker
