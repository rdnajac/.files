local is_wide_enough = function()
  return vim.o.columns >= 160
end

---@class snacks.dashboard.Config
local dashboard = {
    -- stylua: ignore
  preset = {
    keys = {
      { icon = ' ', title = 'Recent Files', key = 'f', action = function() Snacks.picker.recent() end },
      { section = 'recent_files', indent = 2, enabled = function() return is_wide_enough() end },
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = ' ', key = 'g', desc = 'Lazygit', action = function() Snacks.lazygit() end },
      { icon = ' ', key = 'c', desc = 'Config',  action = function() Snacks.picker.files({cwd = vim.fn.expand('$DOTDIR')}) end },
      { icon = '󰄻 ', key = 'z', desc = 'Zoxide',  action = function() Snacks.picker.zoxide() end },
      { icon = '󰒲 ', key = 'l', desc = 'Lazy',    action = ':Lazy' },
      { icon = ' ', key = 'x', desc = 'Extras',  action = ':LazyExtras' },
      { icon = '󱌣 ', key = 'm', desc = 'Mason',   action = ':Mason' },
      { icon = ' ', key = 'h', desc = 'Health',  action = ':checkhealth' },
      { icon = ' ', key = 'q', desc = 'Quit',    action = ':qa' },
    }
  },
  formats = {
    key = function(item)
      return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } }
    end,
  },
  sections = {
    {
      section = 'terminal',
      cmd = require('util.dashboard').unown(),
      padding = 2,
      width = 69,
      align = 'center',
      enabled = function()
        return vim.o.lines >= 48
      end,
    },
    { section = 'keys' },
    function()
      return vim.o.lines < 48 and {}
        or (function()
          local t = {
            section = 'terminal',
            cmd = require('util.dashboard').cowsay(),
            -- hl = 'header',
            -- padding = 1,
            indent = 9,
            height = 10,
          }
          if is_wide_enough() then t.pane = 2 end
          if is_wide_enough() then t.padding = 3 end
          return t
        end)()
    end,
    { padding = 1 },
    { section = 'startup' },
    function()
      return vim.o.columns < 160 and {}
        or {
          pane = 2,
          icon = '      ',
          title = 'Git Status',
          section = 'terminal',
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = 'git status --short --branch --renames',
          -- height = 5,
          padding = 1,
          indent = 9,
        }
    end,
  },
}

return dashboard
