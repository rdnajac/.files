-- config/nvim/lua/util/init.lua
local M = {}

M.setup = function()
  require('util.munchies')
  require('util.ooze')
  require('util.nnn').init()
end

return M
