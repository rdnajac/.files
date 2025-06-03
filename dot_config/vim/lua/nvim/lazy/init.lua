local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

require('lazy').setup({
  spec = {
    {
      'LazyVim/LazyVim',
      { import = 'lazyvim.plugins.coding' },
      { import = 'lazyvim.plugins.extras.editor.dial' },
      { import = 'lazyvim.plugins.extras.util.mini-hipatterns' },
      { import = 'lazyvim.plugins.extras.ui.treesitter-context' },
    },
    'tpope/vim-abolish',
    'tpope/vim-apathy',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-tbone',
    'tpope/vim-unimpaired',
    'stevearc/oil.nvim',
    {
      import = 'nvim.lazy.spec',
    },
  },
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
    reset_packpath = true,
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
