if !exists('g:shellharden')
  let g:shellharden = 1
endif

if executable('shfmt')
  setlocal formatprg=shfmt\ -bn\ -sr
  let &l:formatprg = 'shfmt -bn -sr'
  if executable('shellharden')
    " pipe the formatprg output to shellharden if shellharden is enabled
    if get(b:, 'shellharden', get(g:, 'shellharden', 0))
      let &l:formatprg .= ' | shellharden --transform ""'
    endif
  endif
endif
