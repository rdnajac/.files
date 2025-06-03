vim.g.lazyvim_check_order = false

-- require('lazyvim.config').init()
require('lazyvim.util.plugin').lazy_file()

return {
  {
    'LazyVim/LazyVim',

    dependancies = {
 'folke/tokyonight.nvim' },
    ---@class LazyVimOptions
    opts = {
      defaults = { autocmds = false, keymaps = false, },
      news = { lazyvim = false, neovim = false, },
    },
  },
  { 'nvim-lua/plenary.nvim', lazy = true },
}
