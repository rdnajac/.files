_G.LazyVim = require("lazyvim.util")

LazyVim.plugin.lazy_file()

---@type LazyPicker
LazyVim.pick.register({
  name = "snacks",
  commands = {
    files = "files",
    live_grep = "grep",
    oldfiles = "recent",
  },

  ---@param source string
  ---@param opts? snacks.picker.Config
  open = function(source, opts)
    return Snacks.picker.pick(source, opts)
  end,
})

vim.api.nvim_create_user_command('LazyExtras', function()
  LazyVim.extras.show()
end, { desc = 'Manage LazyVim extras' })

vim.api.nvim_create_user_command('LazyHealth', function()
  vim.cmd([[Lazy! load all]])
  vim.cmd([[checkhealth]])
end, { desc = 'Load all plugins and run :checkhealth' })

return {
  {
    'LazyVim/LazyVim',
    version = false,
    -- stylua: ignore
    ---@class LazyVimOptions
    opts = {
      defaults = { autocmds = false, keymaps = false },
      news     = { lazyvim  = false, neovim  = false },
    },
  },
  { 'nvim-lua/plenary.nvim', lazy = true },
}
