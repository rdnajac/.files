vim.g.lazyvim_check_order = false

require('lazyvim.config').init()

return {
  {
    'LazyVim/LazyVim',

    ---@class LazyVimOptions
    opts = {
      defaults = { autocmds = false, keymaps = false, },
      news = { lazyvim = true, neovim = true, },
    },
  },
  { 'nvim-lua/plenary.nvim', lazy = true },
}
