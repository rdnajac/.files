return {
  { 'tpope/vim-abolish' },
  { 'tpope/vim-tbone' },
  {
    'tpope/vim-eunuch',
    init = function()
      vim.cmd([[
      let g:eunuch_interpreters = {
      \ '.':      '/bin/sh',
      \ 'sh':     '/bin/sh',
      \ 'bash':   'bash',
      \ 'zsh':    'zsh',
      \ 'lua':    'lua',
      \ 'python': 'python3',
      \ 'r':      'Rscript',
      \ }
      ]])
    end,
  },
  -- Use latest development versions
  { 'folke/lazy.nvim', version = false },
  { 'LazyVim/LazyVim', version = false },
}
