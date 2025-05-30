local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

-- Don't load LazyVim options
package.loaded['lazyvim.config.options'] = true

-- Quiet error on startup
vim.g.lazyvim_check_order = false

require('lazy').setup({
  spec = {
    {
      'LazyVim/LazyVim',
      opts = {
        defaults = {
          autocmds = false,
          keymaps = false,
        },
      },
      keys = {
        { '<leader>l', '<Cmd>Lazy<CR>', desc = 'Lazy' },
        { '<leader>L', '<Cmd>LazyExtras<CR>', desc = 'LazyExtras' },
      },
    },
    { import = 'nvim.lazy.spec' },
  },
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

require('nvim.lazy.goto')
