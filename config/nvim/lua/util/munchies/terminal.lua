local str = [["The computing scientist's main challenge is not to get confused by the complexities of his own making."]]

local setseed = function()
  math.randomseed(os.time())
end

local M = {}

M.unown = function()
  local strings = {
    'lazy',
    'nvim',
    'ryan',
    '\\?\\?\\?\\?\\?',
    'wow!',
    'quit',
    'cbmf',
  }

  setseed()
  return 'unown ' .. strings[math.random(#strings)]
end

M.cowsay = function()
  local cmd = ''

  setseed()
  if math.random(1, 2) == 1 then
    cmd = 'cowsay ' .. str
  else
    -- Add a timestamp to make each command unique
    cmd = 'sh -c "fortune -s | cowsay # ' .. os.time() .. '"'
  end
  return cmd
end

return M
