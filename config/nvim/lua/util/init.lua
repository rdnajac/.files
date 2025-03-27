-- config/nvim/lua/util/init.lua
local M = {}

M.setup = function()
  require('util.nnn').setup()
  require('util.ooze').setup()
end

return M
