local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

require('lazy').setup({
  spec = { import = 'lazy.spec' },
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
  install = { colorscheme = { 'tokyonight' } },
  ui = {
    border = 'rounded',
    custom_keys = {
      ['<localleader>d'] = {
        function(plugin)
          dd(plugin)
        end,
        desc = 'Debug Plugin',
      },
    },
  },
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
