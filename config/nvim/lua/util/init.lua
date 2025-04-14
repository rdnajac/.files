-- silence checkhealth errors
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- set up global debug functions
_G.dd = function(...)
  Snacks.debug.inspect(...)
end

_G.bt = function()
  Snacks.debug.backtrace()
end

-- Override print to use snacks for `:=` command
vim.print = _G.dd

_G.warn = function(msg)
  vim.notify(msg, vim.log.levels.WARN)
end

-- configure filetype detection
vim.filetype.add({ pattern = { ['.*/git/config'] = 'gitconfig' } })
vim.filetype.add({
  pattern = {
    ['.*/tmux/.*%.conf'] = { 'tmux', { priority = 1 } },
    ['^%.?tmux.*%.conf'] = { 'tmux', { priority = -1 } },
  },
})

-- set up utilities
require('util.goto').setup()
require('util.nnn').setup()
require('util.ooze').setup()
