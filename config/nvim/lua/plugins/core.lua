return {
  { 'tpope/vim-abolish' },
  { 'tpope/vim-tbone' },
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<C-h>', '<Cmd>TmuxNavigateLeft<Cr>' },
      { '<C-j>', '<Cmd>TmuxNavigateDown<Cr>' },
      { '<C-k>', '<Cmd>TmuxNavigateUp<Cr>' },
      { '<C-l>', '<Cmd>TmuxNavigateRight<Cr>' },
    },
  },

  {
    'max397574/better-escape.nvim',
    opts = {},
    event = 'InsertEnter',
  },

  -- Use latest development versions
  { 'folke/lazy.nvim', version = false },
  { 'LazyVim/LazyVim', version = false },
}
