vim.g.lazyvim_check_order = false

-- require('lazyvim.config').init()
require('lazyvim.util.plugin').lazy_file()

  local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function()
      require('nvim.config')
    end,
  })
return {
  {
    'LazyVim/LazyVim',
    ---@class LazyVimOptions
    opts = {
      defaults = { autocmds = false, keymaps = false },
      news = { lazyvim = false, neovim = false },
    },
  },
  { 'nvim-lua/plenary.nvim', lazy = true },
}
