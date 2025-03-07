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
  -- Use latest development versions
  { "folke/lazy.nvim", version = false },
  { "LazyVim/LazyVim", version = false },
}
