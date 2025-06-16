local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

---@type LazySpec
local spec = {
  {
    'LazyVim/LazyVim',
    import = 'lazyvim.plugins',
    keys = {
      { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
      { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
    },
  },
  -- { import = 'user.plugins' },
}

require('lazy').setup(spec, {
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
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

  performance = {
    rtp = {
      reset = true,
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
