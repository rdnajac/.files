function! s:ExeclamVisual(command) range
  let old_z = @z

  normal! gv"zy
  call s:Execlam(a:command, @z)

  let @z = old_z
endfunction

function! s:ExeclamNormal(ranged, l1, l2, command) " {{{
  if a:ranged
    let lines = getline(a:l1, a:l2)
    let stdin = join(lines, "\n") . "\n"

    call s:Execlam(a:command, stdin)
  else
    call s:Execlam(a:command)
  endif
endfunction

function! s:Execlam(command, ...)
  " Build the actual command string to execute
  let command = join(map(split(a:command), 'expand(v:val)'))

  " Run the command
  echo 'Executing: ' . command

  if a:0 == 0
    let result = system(command)
  elseif a:0 == 1
    let result = system(command, a:1)
  else
    echom "Invalid number of arguments passed to Execlam()!"
    return
  endif

  echo 'Shell command executed: ' . command
endfunction

command! -range=0 -complete=shellcmd -nargs=+ Clam call s:ExeclamNormal(<count>, <line1>, <line2>, <q-args>)
command! -range=% -complete=shellcmd -nargs=+ ClamVisual call s:ExeclamVisual(<q-args>)
