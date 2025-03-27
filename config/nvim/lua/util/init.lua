-- config/nvim/lua/util/init.lua
local M = {}

M.setup = function()
  _G.dd = function(...) Snacks.debug.inspect(...) end
  _G.bt = function()    Snacks.debug.backtrace()  end
  vim.print = _G.dd -- Override print to use snacks for `:=` command
  require('util.nnn').setup()
  require('util.ooze').setup()
end

return M
