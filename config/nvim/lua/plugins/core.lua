return {
  { 'tpope/vim-abolish' },
  { 'tpope/vim-tbone' },
  { 'christoomey/vim-tmux-navigator' },
  {
    'tpope/vim-eunuch',
    lazy = false,
    keys = {
      { ',D', '<Cmd>Delete!<CR>', desc = 'Delete the file from disk' },
    },
  },

  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
      },
    },
    keys = {
      { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
      { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
    },
  },
}
