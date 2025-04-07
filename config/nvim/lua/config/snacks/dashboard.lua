local str = [["The computing scientist's main challenge is not to get confused by the complexities of his own making."]]

-- stylua: ignore start
local short = function() return vim.o.lines < 48 end
local narrow = function() return vim.o.columns < 48 end
local wide = function() return vim.o.columns >= 128 end
local setseed = function() math.randomseed(os.time()) end
-- stylua: ignore end

local unown = function()
  local strings = {
    'lazy',
    'nvim',
    'ryan',
    '\\?\\?\\?\\?\\?',
    'wow!',
    'quit',
    'cbmf',
    'cmd',
  }
  setseed()
  return 'unown ' .. strings[math.random(#strings)]
end

local cowsay = function()
  local cmd = ''
  setseed()
  if math.random(1, 2) == 1 then
    cmd = 'cowsay ' .. str .. ' | lolcat'
  else
    -- Add a timestamp to make each command unique
    cmd = 'fortune -n 69 -s | cowsay | lolcat # ' .. os.time()
  end
  return cmd
end

---@class snacks.dashboard.Config
-- stylua: ignore
local M = {
  preset = {
    keys = {
      { icon = ' ', key = 'f', title = 'Files',   action = function() Snacks.picker.recent() end, enabled = function() return not wide() end, },
      { icon = ' ', key = 'g', title = 'Lazygit', action = function() Snacks.lazygit() end, enabled = function() return not wide() end },
      { icon = " ", key = "s", desc = 'Session',  action = function() require("persistence").load({ last = true }) end },
      { icon = ' ', key = 'c', desc = 'Config',   action = function() Snacks.picker.files({cwd = vim.fn.expand('$DOTDIR')}) end },
      { icon = '󰄻 ', key = 'z', desc = 'Zoxide',   action = function() Snacks.picker.zoxide() end },
      { icon = '󰒲 ', key = 'l', desc = 'Lazy',     action = ':Lazy' },
      { icon = ' ', key = 'x', desc = 'Extras',   action = ':LazyExtras' },
      { icon = '󱌣 ', key = 'm', desc = 'Mason',    action = ':Mason' },
      { icon = ' ', key = 'h', desc = 'Health',   action = ':checkhealth' },
      { icon = ' ', key = 'q', desc = 'Quit',     action = ':qa' },
    }
  },
  formats = { key = function(item) return {{'[ ', hl = 'special' }, {item.key, hl = 'key'}, {' ]', hl = 'special'}} end },
  sections = {
    {
      section = 'terminal',
      padding = 2,
      width = 69,
      cmd = unown(),
      enabled = function() return not short() and not narrow() end,
    },
    {
      pane = 1, enabled = function() return wide() end,
      { icon = ' ', title = 'Recent Files', key = 'f', action = function() Snacks.picker.recent() end },
      { section = 'recent_files', indent = 2, enabled = function() return wide() end },
      { icon = ' ', title = 'Lazygit', key = 'g', action = function() Snacks.lazygit() end },
      {
        section = 'terminal',
        enabled = function() return Snacks.git.get_root() ~= nil end,
        cmd = 'git status --short --branch --renames',
        padding = 1,
        indent = 1,
      },
    },
    {
      section = 'keys', pane = 1,
      enabled = function() return not wide() end, },
    {
      section = 'terminal',
      indent = 11,
      height = 10,
      pane = wide() and 2 or 1,
      cmd = cowsay(),
      enabled = function() return not narrow() end,
      padding = 2,
    },
    {
      section = 'keys', pane = 2,
      gap = 1,
      enabled = function() return wide() end,
    },
    { padding = 1 },
    { section = 'startup', align = 'center', indent = wide() and math.floor(vim.o.columns / 2 - 20) or 0 },
  },
}

return M
