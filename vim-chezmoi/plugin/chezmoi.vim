if !exists('g:chezmoi#source_dir_path')
  let g:chezmoi#source_dir_path = expand('~/.local/share/chezmoi')
endif

lua << EOF
local chezmoi_lsp = require('chezmoi._lsp')
vim.lsp.config('chezmoi_lsp', { cmd = chezmoi_lsp.cmd, root_dir = chezmoi_lsp.root_dir })
vim.lsp.enable('chezmoi_lsp')
EOF
