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

