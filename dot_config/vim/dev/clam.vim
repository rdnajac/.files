" Return selected text or current line with newline
function! CaptureText() abort
  if mode() ==# 'n'
    return getline('.') . "\n"
  endif
  let save_z = @z
  silent normal! "zy
  let text = @z
  let @z = save_z
  return text
endfunction

" Test current line
function! TestCaptureLine() abort
  echo getline('.') . "\n"
endfunction

" Test visual selection
function! TestCaptureVisual() abort
  echo CaptureText()
endfunction

" Combined command input capture
function! CaptureInput(ranged, l1, l2, cmd) abort
  if mode() ==# 'n'
    if a:ranged
      return [a:cmd, join(getline(a:l1, a:l2), "\n") . "\n"]
    endif
    return [a:cmd]
  endif
  return [a:cmd, CaptureText()]
endfunction

" Execute with combined input
function! ExecuteInput(ranged, l1, l2, cmd) abort
  let args = CaptureInput(a:ranged, a:l1, a:l2, a:cmd)
  echo system(args[0], get(args, 1, ''))
endfunction

command! TestCaptureLine   call TestCaptureLine()
command! TestCaptureVisual call TestCaptureVisual()
command! -range=% -nargs=+ ExecuteInput call ExecuteInput(<count>, <line1>, <line2>, <q-args>)
