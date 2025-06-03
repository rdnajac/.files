local M = {}

M.opts = {
  sections = {
    { section = 'header' },
    { section = 'keys', padding = 1 },
    { section = 'startup' },
  },
  preset = {
    ---@type snacks.dashboard.Item[]
    keys = {
      { icon = ' ', title = 'Recent Files' },
      { section = 'recent_files', indent = 2, gap = 0 },
      {
        icon = ' ',
        key = 'g',
        title = 'Lazygit',
        action = function()
          Snacks.lazygit()
        end,
        enabled = function()
          return Snacks.git.get_root() ~= nil
        end,
      },
      -- TODO use Snacks
      -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = ' ', key = 'c', desc = 'Config', action = ':Chezmoi' },
      { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
      { icon = ' ', key = 'x', desc = 'Extras', action = ':LazyExtras' },
      { icon = ' ', key = 'h', desc = 'Health', action = ':checkhealth' },
      { icon = '󱌣 ', key = 'm', desc = 'Mason', action = ':Mason' },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
  },
}

return M
