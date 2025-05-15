local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

require('lazy').setup({
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
  spec = { import = 'lazy.spec' },
  install = { colorscheme = { 'tokyonight' } },
  ui = { border = 'rounded', },
  rocks = { enabled = false },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
      disabled_plugins = {
	'gzip',
	-- 'matchit',
	-- 'matchparen',
	-- 'netrwPlugin',
	'tarPlugin',
	'tohtml',
	'tutor',
	'zipPlugin',
      },
    },
  },
  profiling = {
    loader = false,
    require = false,
  },
})

