vim.g.lazyvim_check_order = false

---@class LazyVimOptions
local opts = {
  defaults = {
    autocmds = true, -- lazyvim.config.autocmds
    keymaps = true,  -- lazyvim.config.keymaps
    -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
    -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
  },
  news = {
    lazyvim = true,
    neovim = true,
  },
}
require("lazyvim.config").setup(opts)
require("lazyvim.config").init()

return {
  { 'nvim-lua/plenary.nvim', lazy = true },
}
