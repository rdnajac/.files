local str = [["The computing scientist's main challenge is not to get confused by the complexities of his own making."]]

local cowsay = function()
  local cmd = ''
  math.randomseed(os.time())
  if math.random(1, 2) == 1 then
    cmd = 'cowsay ' .. str .. ' | lolcat'
  else
    -- Add a timestamp to make each command unique
    cmd = 'fortune -n 69 -s | cowsay | lolcat # ' .. os.time()
  end
  return cmd
end

---@class snacks.dashboard.Config
local M = {
  preset = {
    keys = {
      {
        section = 'terminal',
        indent = 11,
        height = 10,
        cmd = cowsay(),
        padding = 2,
      },
      {
        icon = ' ',
        key = 'f',
        title = 'Files',
        action = function()
          Snacks.picker.recent()
        end,
      },
      { section = 'recent_files' },
      {
        icon = ' ',
        key = 'g',
        title = 'Lazygit',
        action = function()
          Snacks.lazygit()
        end,
      },
      {
        icon = ' ',
        key = 's',
        desc = 'Session',
        action = function()
          require('persistence').load({ last = true })
        end,
      },
      {
        icon = ' ',
        key = 'c',
        desc = 'Config',
        action = function()
          Snacks.picker.files({ cwd = vim.fn.expand('$DOTDIR') })
        end,
      },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
  },
  formats = {
    key = function(item)
      return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } }
    end,
  },
  sections = {
    { section = 'keys' },
    { padding = 1 },
    -- { section = 'startup' },
  },
}

return M
