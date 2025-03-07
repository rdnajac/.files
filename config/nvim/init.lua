-- init.lua
require('config.lazy').load({
  performance = {
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        'netrwPlugin',
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
require('util')

vim.filetype.add({
  pattern = {
    ['.*/git/config'] = 'gitconfig',
  },
})
