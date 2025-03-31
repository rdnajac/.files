-- config/nvim/lua/util/init.lua
local M = {}

M.setup = function()
  -- BUG: Why are these showing up as duplicate fields?
  _G.dd = function(...) Snacks.debug.inspect(...) end
  _G.bt = function()    Snacks.debug.backtrace()  end
  vim.print = _G.dd -- Override print to use snacks for `:=` command

  _G.warn = function(msg)
    vim.notify(msg, vim.log.levels.WARN)
  end

  vim.filetype.add({ pattern = { ['.*/git/config']  = 'gitconfig' } })
vim.filetype.add({
  pattern = {
    ['.*/tmux/.*%.conf'] = { 'tmux', { priority = 1 } },
    ['^%.?tmux.*%.conf'] = { 'tmux', { priority = -1 } },
  }
})

  require('util.snippet')
  require('util.goto').setup()
  require('util.nnn').setup()
  require('util.ooze').setup()
end

return M
