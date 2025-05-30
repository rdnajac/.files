local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim/'

if not vim.uv.fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

-- HACK: define own LazyFile event
local Event = require('lazy.core.handler.event')
Event.mappings.LazyFile = {
  id = 'LazyFile',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
Event.mappings['User LazyFile'] = Event.mappings.LazyFile

-- noop if we skip importing plugins
-- package.loaded['lazyvim.config.options'] = true
