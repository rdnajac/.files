if !exists('g:chezmoi#source_dir_path')
  let g:chezmoi#source_dir_path = expand('<script>:p:h')
endif

lua require('chezmoi._lsp').setup()
