" config/nvim/plugin/ooze.vim
lua <<EOF
function Quarto_is_in_python_chunk()
  return require('otter.tools.functions').is_otter_language_context('python')
end
EOF

let g:slime_dispatch_ipython_pause = 100

function SlimeOverride_EscapeText_quarto(text)
  call v:lua.Quarto_is_in_python_chunk()
  if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
  else
    if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
    else
      return [a:text]
    endif
  endif
endfunction
