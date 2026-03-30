local lazypath = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')
if not vim.uv.fs_stat(lazypath) then
  assert(loadstring(vim.fn.system([[
      curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua]]))())
else
  vim.opt.rtp:prepend(lazypath)
end

local spec = {
  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = true,
      },
    },
  },
  { 'folke/lazy.nvim', version = false },
}

---@type LazyConfig
local opts = {
  install = { colorscheme = { 'tokyonight' } },
  performance = {
    reset_packpath = false,
    rtp = { reset = false },
  },
  pkg = { enabled = false },
  rocks = { enabled = false },
  profiling = { loader = false, require = false },
  change_detection = { enabled = false, notify = true },
}

require('lazy').setup({ { 'LazyVim/LazyVim', import = 'lazyvim.plugins' }, spec }, opts)
