-- init.lua
require('config.lazy').load({
  dev = {
    path = '~/GitHub/rdnajac',
    fallback = true,
  },
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

require('util').setup()
