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

vim.filetype.add({ pattern = { ['.*/git/config'] = 'gitconfig' } })
vim.filetype.add({
  pattern = {
    ['.*/tmux/.*%.conf'] = { 'tmux', { priority = 1 } },
    ['^%.?tmux.*%.conf'] = { 'tmux', { priority = -1 } },
  },
})

require('util.goto').setup()
require('util.nnn').setup()
require('util.ooze').setup()
