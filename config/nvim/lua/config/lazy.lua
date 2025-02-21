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
        { import = 'lazyvim.plugins.init' },
        { import = 'lazyvim.plugins.lsp.init' },
        { import = 'lazyvim.plugins.formatting' },
        { import = 'lazyvim.plugins.linting' },
        { import = 'lazyvim.plugins.ui' },
        { import = 'lazyvim.plugins.xtras' },
        { import = 'lazyvim.plugins.extras.ai.copilot-chat' },
        { import = 'lazyvim.plugins.extras.util.mini-hipatterns' },
        { import = 'lazyvim.plugins.extras.editor.navic' },
        -- for lang extras, see `~/.config/nvim/lazyvim.json`
      },
      { import = 'plugins' },
    },
    lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
    pkg = { enabled = false },
    rocks = { enabled = false },
    ---@diagnostic disable-next-line: assign-type-mismatch
    dev = { path = '~/GitHub', patterns = { 'rdnajac' }, fallback = true },
    install = { colorscheme = { 'tokyonight' } },
    ui = {
      border = 'rounded',
      -- stylua: ignore
      custom_keys = {
        ["<localleader>d"] = function(plugin) dd(plugin) end,
      },
    },
  }, opts or {})
  require('lazy').setup(opts)
end

return M
