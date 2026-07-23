if exists('g:loaded_chezmoi_nvimrc') || !executable('chezmoi')
  finish
endif
let g:loaded_chezmoi_nvimrc = 1
set runtimepath+=.

lua << EOF
local chezmoi_lsp = require('chezmoi._lsp')
vim.lsp.config('chezmoi_lsp', { cmd = chezmoi_lsp.cmd, root_dir = chezmoi_lsp.root_dir })
vim.lsp.enable('chezmoi_lsp')
EOF
