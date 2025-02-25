" Location: plugin/apathy.vim
" Author: Tim Pope <http://tpo.pe/>

if exists('g:loaded_apathy')
  finish
endif
let g:loaded_apathy = 1

if &g:path =~# '\v^\.,/%(usr|emx)/include,,$'
  setglobal path=.,,
endif
setglobal include=
setglobal includeexpr=
setglobal define=

setglobal isfname+=@-@

" function! s:CPreProcIncludes(exe, opts) abort
"   let paths = []
"   let active = 0
"   for line in executable(a:exe) ? split(system(a:exe . ' ' . a:opts), "\n") : []
"     if line =~# '^#include '
"       let active = 1
"     elseif line =~# '^\S'
"       let active = 0
"     elseif active
"       call add(paths, matchstr(line, '\S\+'))
"     endif
"   endfor
"   return paths
" endfunction
"
" augroup apathy_c
"   autocmd!
"   autocmd FileType c,cpp if &filetype ==# 'cpp'
"         \ if !exists('g:cpp_path')
"         \   let g:c_path_compiler = get(g:, 'c_path_compiler', executable('clang') ? 'clang' : 'gcc')
"         \   let g:cpp_path = ['.'] + s:CPreProcIncludes(g:c_path_compiler, '-E -v -x c++ /dev/null')
"         \ endif
"         \ call apathy#Prepend('path', g:cpp_path)
"         \ else
"         \ if !exists('g:c_path')
"         \   let g:c_path_compiler = get(g:, 'c_path_compiler', executable('clang') ? 'clang' : 'gcc')
"         \   let g:c_path = ['.'] + s:CPreProcIncludes(g:c_path_compiler, '-E -v -x c /dev/null')
"         \ endif
"         \ call apathy#Prepend('path', g:c_path)
"         \ endif
"   autocmd FileType c,cpp setlocal include=^\\s*#\\s*include\\s*[\"<]\\@=
"   autocmd FileType c,cpp setlocal includeexpr&
"   autocmd FileType c,cpp setlocal define&
"   autocmd FileType c,cpp call apathy#Undo()
" augroup END
