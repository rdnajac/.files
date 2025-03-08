-- lua/config/lazy.lua
local lazyroot = vim.fn.stdpath('data') .. '/lazy'
local lazypath = lazyroot .. '/lazy.nvim/'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

local M = {}

---@param opts LazyConfig
function M.load(opts)
  opts = vim.tbl_deep_extend('force', {
    root = lazyroot,
    ---@type LazySpec
    spec = {
      {
        'LazyVim/LazyVim',
        import = 'lazyvim.plugins',
        keys = {
          { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
          { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
        },
      },
      { import = 'plugins' },
    },
    lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
    pkg = { enabled = false },
    rocks = { enabled = false },
    install = { colorscheme = { 'tokyonight' } },
    ui = {
      border = 'rounded',
      -- stylua: ignore
      custom_keys = {
        ["<localleader>d"] = { function(plugin) dd(plugin) end, desc = 'Debug Plugin'},
        ["<localleader>g"] = { function(plugin) Snacks.picker.grep({cwd=plugin.dir}) end, desc = 'Grep Plugin Directory' },
        ["<localleader>f"] = { function(plugin) Snacks.picker.files({cwd=plugin.dir}) end, desc = 'Find Plugin File' },
      },
    },
    change_detection = {
      enabled = true,
      notify = false,
    },
  }, opts or {})
  require('lazy').setup(opts)
end

return M
