-- init.lua
require('config.lazy').load({
  -- performance = { rtp = { paths = { vim.fn.expand('~/Desktop/GitHub/rdnajac/after') } } },
  profiling = {
    loader = false,
    require = false,
  },
})
require('util')
