" init.vim (like vimrc but for my neovim config)

let s:vimrc = expand('<sfile>')
" Edit this file with `<leader>v` {{{
if !exists('*VimConfig')
  function! VimConfig() abort
    execute 'edit ' . s:vimrc
  endfunction
  nnoremap <leader>v :call VimConfig()<CR>
endif
" }}} -------------------------------------------------------------------
" Source this file with `<leader>r` to reload configuration {{{
if !exists('*ReloadVimConfig')
  function! ReloadVimConfig() abort
    execute 'source ' . s:vimrc | echo 'Sourced ' . s:vimrc . '!'
    " source autoload/ooze.vim
  endfunction
  nnoremap <leader>r :call ReloadVimConfig()<CR>
endif
" }}} -------------------------------------------------------------------
" Configure filetype-specific settings like shiftwidth and tabstop {{{
augroup FileTypeSettings
  autocmd!
  autocmd FileType *        setlocal foldmethod=marker
  autocmd FileType sh,zsh   setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c        setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda setlocal sw=4 sts=4
  autocmd FileType python   setlocal sw=4 sts=4
  autocmd FileType r        setlocal sw=2 sts=2
  " autocmd FileType tex    setlocal            fdm=syntax
  autocmd FileType vim,lua  setlocal sw=2 sts=2 kp=:help
augroup END
" }}} -------------------------------------------------------------------

" Section: Key Maps {{{

" paste without overwriting the register
vnoremap p "_dP

map <silent> <C-q> <Cmd>bd<CR>
" no Ex mode, instead Q formats and saves
nnoremap Q <nop>

" Swap <Shift> modifier for some keys
nnoremap ` ~
nnoremap ~ `

nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

" insert mode
iabbrev n- –
iabbrev m- —

" add undo break-points (`:help i_ctrl-g`)
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

" better indenting
vnoremap < <gv
vnoremap > >gv

cnoreabbrev !! !./%
cnoreabbrev ?? verbose set?<Left>
" TODO: rewrite as a command in lua and notify
cnoreabbrev <expr> L getcmdtype() == ':' && getcmdline() ==# 'L' ? '<c-r><c-l>' : 'L'

" creating a command is less problematic than a cmdline abbreviation
command! Wq wqa!

function! Scp(dest) abort
  if a:dest == ''
    echoerr 'Usage: :Scp user@host:/remote/path'
    return
  endif
  write
  execute '!scp % ' . shellescape(a:dest)
endfunction

function! Scp(dest) abort
  if a:dest == ''
    echoerr 'Usage: :Scp user@host[:/remote/path]'
    return
  endif

  let target = a:dest =~ ':' ? a:dest : a:dest . ':~/'
  write
  execute '!scp % ' . shellescape(target)
endfunction

function! ScpComplete(A, L, P) abort
  let all = split(system("grep '^Host\\>' ~/.ssh/config | awk '{print $2}'"), "\n")
  return filter(all, 'v:val =~? "^" . a:A')
endfunction
command! -nargs=1 -complete=customlist,ScpComplete Scp call Scp(<f-args>)


command! BreakHere call utils#breakHere()
command! ReplaceSelection call utils#replaceSelection()
command! QuickFormat call format#buffer()
command! CleanWhitespace call format#whitespace()
nmap <leader>fw <cmd>CleanWhitespace<CR>

nnoremap <M-j> <Cmd>BreakHere<CR>
inoremap <M-j> <Cmd>BreakHere<CR>
nnoremap Q <cmd>QuickFormat<CR>
vnoremap <C-r> <cmd>ReplaceSelection<CR>

nnoremap <leader>A :normal! ggVG<CR>

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

" vim: fdm=marker fdl=1
