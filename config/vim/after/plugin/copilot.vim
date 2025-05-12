let g:copilot_workspace_folders = ['~/GitHub']

if has('nvim')
  let g:copilot_no_maps = v:true

  " Block the normal Copilot suggestions
  augroup github_copilot
    autocmd!
    autocmd FileType,BufUnload * call copilot#OnFileType()
  augroup END

  call copilot#OnFileType()
endif
