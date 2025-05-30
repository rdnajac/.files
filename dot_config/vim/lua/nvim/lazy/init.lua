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
      init = function()
        -- package.loaded['lazyvim.config.options'] = true
        vim.g.lazyvim_check_order = false
      end,
      opts = { defaults = { autocmds = false, keymaps = false } },
      -- stylua: ignore
      keys = {
        { 'gL', function() require('nvim.lazy.goto') end, { desc = 'Goto LazyVim module' }, },
        { '<leader>l', '<Cmd>Lazy<CR>', desc = 'Lazy' },
        { '<leader>L', '<Cmd>LazyExtras<CR>', desc = 'LazyExtras' },
      },
    },
    { import = 'nvim.lazy.spec' },
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
