return {
  { 'folke/lazy.nvim', version = false },
  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
      },
    },
  },
  -- { 'tpope/vim-abolish' },
  { 'tpope/vim-apathy' },
  -- { 'tpope/vim-tbone' },
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
    event = 'VeryLazy',
    opts = {
      mappings = {
        i = {
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
          k = { j = '<Esc>' },
        },
        c = {
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
          k = { j = '<Esc>' },
        },
        t = {
          j = { k = '<C-\\><C-n>' },
          k = { j = '<C-\\><C-n>' },
        },
        v = {
          j = { k = '<Esc>' },
          k = { j = '<Esc>' },
        },
        s = {
          j = { k = '<Esc>' },
          k = { j = '<Esc>' },
        },
      },
    },
  },
}
