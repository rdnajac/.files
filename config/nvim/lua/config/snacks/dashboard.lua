local str = [["
The computing scientist's main challenge is not to
get confused by the complexities of his own making.
"]]

-- TODO: rewrite the command in lua
local function unown_command()
  local strings = {
    'lazy',
    'nvim',
    'ryan',
    '\\?\\?\\?\\?',
    'wow!',
    'quit',
    'cbmf',
  }

  math.randomseed(os.time())
  return 'unown ' .. strings[math.random(#strings)]
end

---@class snacks.dashboard.Config
return {
  formats = {
    key = function(item)
      return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } }
    end,
  },

  -- stylua: ignore
  sections = {

    { section = 'terminal', cmd = unown_command(), padding = 1, width = 69},
    { padding = 1 },
    { icon = ' ', title = 'Recent Files', key = 'f', action = function() Snacks.picker.recent() end,
      section = 'recent_files',
      indent = 2,
    },
    { icon = " ", key = "s", desc = "Session", section = "session" },
    { icon = ' ', key = 'g', desc = 'Lazygit',  action = function() Snacks.lazygit() end },
    { icon = ' ', key = 'c', desc = 'Config',   action = function() Snacks.picker.nvimconfig() end },
    { icon = ' ', key = '.', desc = 'Dotfiles', action = function() Snacks.picker.dotfiles() end },
    { icon = '󰄻 ', key = 'z', desc = 'Zoxide',   action = function() Snacks.picker.zoxide() end  },
    { icon = '󰒲 ', key = 'l', desc = 'Lazy',     action = ':Lazy' },
    { icon = ' ', key = 'x', desc = 'Extras',   action = ':LazyExtras' },
    { icon = ' ', key = 'q', desc = 'Quit',     action = ':qa' },
    { section = 'terminal', cmd = 'cowsay ' .. str, hl = 'header', padding = 1, indent = 8 },
    { section = 'startup', padding = 1, },
  },
}
