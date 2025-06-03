vim.g.lazyvim_check_order = false
local Event = require('lazy.core.handler.event')
Event.mappings.LazyFile = {
  id = 'LazyFile',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
Event.mappings['User LazyFile'] = Event.mappings.LazyFile

return {
  { 'nvim-lua/plenary.nvim', lazy = true },
}
