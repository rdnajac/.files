" config/nvim/plugin/cmd.vim

let s:newline = "\n"

function! s:linefeed() abort " {{{
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
function! s:scroll() abort " {{{
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
" }}}
function s:mychansend(text) abort " {{{
  if !exists('g:MyTermChannel')
    echoerr "No terminal channel found"
    return
  endif
  call chansend(g:MyTermChannel, a:text)
  if g:cmd_auto_advance | call s:linefeed() | endif
endfunction
" }}}

function SendLine()
  let line = getline(".")
  if strlen(line) > 0
    call s:mychansend(line . s:newline)
    if g:cmd_auto_scroll | call s:scroll() | endif
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

" vim: fdm=marker fdl=0
