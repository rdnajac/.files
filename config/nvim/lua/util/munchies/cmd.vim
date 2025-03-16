" config/nvim/plugin/cmd.vim
if !exists('g:CurrentTerminalChannel')
  let g:CurrentTerminalChannel = -1
endif

" lua <<EOF
" function GetSnacksTerm()
"   MyTerm = Snacks.terminal.toggle()
"   vim.g.MyTermChannel = vim.bo[MyTerm.buf].channel
"   vim.cmd([[
"   call chansend(g:MyTermChannel, "tmux new-session -A -s snacks-sesh \n")
"   nunmap ,,
"   nnoremap ,, :lua Snacks.terminal.toggle()<CR>
"   tnoremap ,, :lua Snacks.terminal.toggle()<CR>
"   ]])
" end
" EOF
" augroup TerminalChannelCapture
"   autocmd!
"   autocmd TermOpen * let g:CurrentTermChannel = b:terminal_job_id
" augroup END

let s:newline = "\n"

" set globals for auto_advance and auto_scroll
if !exists('g:cmd_auto_advance')
  let g:cmd_auto_advance = 1
endif

if !exists('g:cmd_auto_scroll')
  let g:cmd_auto_scroll = 1
endif

function s:mychansend(text) abort
  if g:CurrentTerminalChannel == -1
    echoerr "No terminal channel found"
    return
  endif
  " if auto scroll is not 0
  if g:cmd_auto_scroll
    call cmd#scroll()
  endif
  call chansend(g:MyTermChannel, a:text)
  if g:cmd_auto_advance
    call cmd#linefeed()
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

command! GetSnacksTerm lua GetSnacksTerm()
command! SendLine call SendLine()
command! -range SendSelection <line1>,<line2>call SendSelection()
command! RunFile call RunFile()

" keymaps
nnoremap <silent> ,. <cmd>SendLine<CR>
vnoremap <silent> <cr> <cmd>SendSelection<CR>
nnoremap <silent> ,<cr> <cmd>RunFile<CR>

" TODO: create a toggle
" create a variable to toggle if we should send on enter
if !exists('g:sendLineOnEnter')
  let g:sendLineOnEnter = 0
endif

if g:sendLineOnEnter
  " send the line on enter
  " TODO: the toggle should set and unset this?
  nnoremap <silent> <cr> <cmd>SendLine<CR>
endif

augroup MyTerminal
  autocmd!
  autocmd Filetype sh,markdown nnoremap <silent> <cr> <cmd>SendLine<CR>
augroup END
