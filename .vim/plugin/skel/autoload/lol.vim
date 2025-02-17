" function here must be defined as function! lol#functioname()

let s:plugin_path = escape(expand('<sfile>:p:h'), '\')

function! lol#cat() abort
  echom '>^.^<' | redraw
endfunction

" :help map-operator
function! lol#operator(type, ...)
  " save state so that we can restore at end of function
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@ " the contents of the unnamed register

  " the '[ and '] marks are set by the g@ when it calls this function
  " we want to get the text between the marksj
  if a:0 " Invoked from Visual model, use gv command
    silent execute "normal! gvy"
  elseif a:type ==# 'line'
    silent execute "normal! `[V`]y"
  else
    silent execute "normal! `[v`]y"
  endif

  " we have the "selected" text in @@ now
  echomsg "'>^.^<': " . @@

  " restore state
  let &selection = sel_save
  let @@ = reg_save
endfunction
