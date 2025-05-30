vim.g.lazyvim_check_order = false

local Event = require('lazy.core.handler.event')
Event.mappings.LazyFile = {
  id = 'LazyFile',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
Event.mappings['User LazyFile'] = Event.mappings.LazyFile

-- noop if we skip importing plugins
-- package.loaded['lazyvim.config.options'] = true
