local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

require('lazy').setup({
  spec = {
    { -- https://www.lazyvim.org/news
      'LazyVim/LazyVim',
      opts = {
      defaults = { autocmds = false, keymaps = false },
  news = { lazyvim = true, neovim = true, },
},
      { import = 'lazyvim.plugins.extras.util.mini-hipatterns' },
    },
    { import = 'nvim.lazy.spec' },
  },
  dev = { path = vim.fn.stdpath('config') .. '/pack/vimfect/start', },
  install = { colorscheme = { 'tokyonight' } },
  ui = {
    border = 'rounded',
      -- stylua: ignore
    custom_keys = {
      ['<localleader>d'] = { function(plugin) dd(plugin) end, desc = 'Debug Plugin', },
    },
  },
  rocks = { enabled = false },
  change_detection = { enabled = true, notify = false },
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
  profiling = { loader = false, require = false },
})
