local lazypath = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')
if not vim.uv.fs_stat(lazypath) then
  load(
    vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua')
  )()
else
  vim.opt.rtp:prepend(lazypath)
end

local spec = {
  { 'folke/lazy.nvim', version = false },
  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
      },
    },
  },
}

---@type LazyConfig
local opts = {
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
      disabled_plugins = {
        -- 'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        -- 'tarPlugin',
        -- 'tohtml',
        -- 'tutor',
        -- 'zipPlugin',
      },
    },
  },
  profiling = {
    loader = false,
    require = false,
  },
  pkg = { enabled = false },
  rocks = { enabled = false },
  -- install = { colorscheme = { 'tokyonight' } },
  change_detection = {
    enabled = true,
    notify = true,
  },
}

require('lazy').setup(spec, opts)
