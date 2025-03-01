local str = [[
The computing scientist's main challenge is not to
get confused by the complexities of his own making
]]

local cmd = 'pokeget unown-l unown unown-z unown-y --hide-name; sleep .1;'
-- local cmd = 'pokeget unown-r unown-y unown unown-n 2> /dev/null',
-- local cmd = 'pokeget unown-n unown-v unown-i unown-m 2> /dev/null',

---@class snacks.dashboard.Config
return {
  preset = {
    header = str,
  },
  formats = {
    key = function(item)
      return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } }
    end,
  },

  -- stylua: ignore
  sections = {
    { section = 'terminal', cmd = cmd, indent = 5, padding = 1 },
    { section = 'startup', padding = 1, },
    {
      icon = ' ',
      title = 'Recent Files',
      key = 'f',
      action = function()
        Snacks.picker.recent()
      end,
      section = 'recent_files',
      indent = 2,
    },
    { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
    { icon = ' ', key = 'x', desc = 'Lazy Extras', action = ':LazyExtras' },
    { icon = ' ', key = 'c', desc = 'Config', action = function() Snacks.picker('files', { cwd = vim.fn.stdpath('config') }) end, },
    { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    { padding = 1 },
    { section = 'header' },
    -- { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
  },
}
