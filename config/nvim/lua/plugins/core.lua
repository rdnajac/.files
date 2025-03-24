return {
  { 'tpope/vim-abolish' },
  { 'tpope/vim-tbone' },
  {
    'jpalardy/vim-slime',
    init = function()
      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
      -- vim.g.slime_python_ipython = 1
      -- vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true
    end,
  },
  -- Use latest development versions
  { 'folke/lazy.nvim', version = false },
  { 'LazyVim/LazyVim', version = false },
}
