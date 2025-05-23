command! -bar -bang -nargs=+ Chmod execute bin#chmod#chmod(<bang>0, <f-args>)
command! -bar -bang          Delete call bin#delete#delete(<bang>0)

" Adapted from autoload/dist/script.vim.
let s:interpreters = {
      \ '.':      '/bin/sh',
      \ 'sh':     '/bin/bash',
      \ 'bash':   'bash',
      \ 'zsh':    'zsh',
      \ 'lua':    'lua',
      \ 'python': 'python3',
      \ 'r':      'Rscript',
      \ }

function! s:NormalizeInterpreter(str) abort
  if empty(a:str) || a:str =~# '^[ /]'
    return a:str
  elseif a:str =~# '[ \''"#]'
    return '/usr/bin/env -S ' . a:str
  else
    return '/usr/bin/env ' . a:str
  endif
endfunction

function! s:FileTypeInterpreter() abort
  try
    let ft = get(split(&filetype, '\.'), 0, '.')
    return s:NormalizeInterpreter(get(s:interpreters, ft, ''))
  endtry
endfunction

let s:shebang_pat = '^#!\s*[/[:alnum:]_-]'

function! EunuchNewLine(...) abort
  if a:0 && type(a:1) == type('')
    return a:1 . (a:1 =~# "\r" && empty(&buftype) ? "\<C-R>=EunuchNewLine()\r" : "")
  endif
  if !empty(&buftype) || getline(1) !~# '^#!$\|' . s:shebang_pat || line('.') != 2 || getline(2) !~# '^#\=$'
    return ""
  endif
  let b:eunuch_chmod_shebang = 1
  let inject = ''
  let detect = 0
  let ret = empty(getline(2)) ? "" : "\<C-U>"
  if getline(1) ==# '#!'
    let inject = s:FileTypeInterpreter()
    let detect = !empty(inject) && empty(&filetype)
  else
    filetype detect
    if getline(1) =~# '^#![^ /].\{-\}[ \''"#]'
      let inject = '/usr/bin/env -S '
    elseif getline(1) =~# '^#![^ /]'
      let inject = '/usr/bin/env '
    endif
  endif
  if len(inject)
    let ret .= "\<Up>\<Right>\<Right>" . inject . "\<Home>\<Down>"
  endif
  if detect
    let ret .= "\<C-\>\<C-O>:filetype detect\r"
  endif
  return ret
endfunction

function! s:MapCR() abort
  imap <silent><script> <SID>EunuchNewLine <C-R>=EunuchNewLine()<CR>
  let map = maparg('<CR>', 'i', 0, 1)
  let rhs = substitute(get(map, 'rhs', ''), '\c<sid>', '<SNR>' . get(map, 'sid') . '_', 'g')
  if get(g:, 'eunuch_no_maps') || rhs =~# 'Eunuch' || get(map, 'desc') =~# 'Eunuch' || get(map, 'buffer')
    return
  endif
  let imap = get(map, 'script', rhs !~? '<plug>') || get(map, 'noremap') ? 'imap <script>' : 'imap'
  if get(map, 'expr') && type(get(map, 'callback')) == type(function('tr'))
    lua local m = vim.fn.maparg('<CR>', 'i', 0, 1); vim.api.nvim_set_keymap('i', '<CR>', m.rhs or '', { expr = true, silent = true, callback = function() return vim.fn.EunuchNewLine(vim.api.nvim_replace_termcodes(m.callback(), true, true, m.replace_keycodes)) end, desc = "EunuchNewLine() wrapped around " .. (m.desc or "Lua function") })
  elseif get(map, 'expr') && !empty(rhs)
    exe imap '<silent><expr> <CR> EunuchNewLine(' . rhs . ')'
  elseif rhs =~? '^\%(<c-\]>\)\=<cr>' || rhs =~# '<[Pp]lug>\w\+CR'
    exe imap '<silent> <CR>' rhs . '<SID>EunuchNewLine'
  elseif empty(rhs)
    imap <script><silent><expr> <CR> EunuchNewLine("<Bslash>035<Bslash>r")
  endif
endfunction
call s:MapCR()

augroup eunuch
  autocmd!
  autocmd BufNewFile  * let b:eunuch_chmod_shebang = 1
  autocmd BufReadPost * if getline(1) !~# '^#!\s*\S' | let b:eunuch_chmod_shebang = 1 | endif
  autocmd BufWritePost,FileWritePost * nested
        \ if exists('b:eunuch_chmod_shebang') && getline(1) =~# s:shebang_pat |
        \   call bin#chmod#chmod(0, '+x', '<afile>') | edit |
        \ endif |
        \ unlet! b:eunuch_chmod_shebang
  autocmd InsertLeave * nested if line('.') == 1 && getline(1) ==# @. && @. =~# s:shebang_pat |
        \ filetype detect | endif
  autocmd User FileChmodPost,FileUnlinkPost "
  autocmd VimEnter * call s:MapCR() | exe 'autocmd eunuch InsertEnter * ++once call s:MapCR()'
augroup END
