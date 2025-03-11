-- config/nvim/lua/util/init.lua
local file = require('util.file')
local goto = require('util.goto')


vim.keymap.set('n', ',fn', file.file_title, { desc = 'Add filename first line' })

vim.keymap.set('n', '\\0', goto.README, { desc = 'Goto Nearest README' })
vim.keymap.set('n', 'gL', goto.lazy, { desc = 'Goto LazyVim config or module' })
vim.keymap.set('n', 'gP', ':!open $(dirname %)<CR>', { desc = 'Goto Parent Directory (in finder)' })

vim.api.nvim_create_user_command('NNN', "lua require('util.nnn').start()", {})

-- Function to define toggleable vim global variables using Snacks.toggle
-- @param opts table containing:
--   name: variable name without 'g:' prefix
--   default: default value (0 or 1)
--   mapping: key mapping string (e.g. '<localleader>ta')
--   desc: description for the mapping (optional)
-- @return the Snacks toggle object
function NewToggle(opts)
  local name = opts.name
  local default = opts.default or 1
  local mapping = opts.mapping
  local desc = opts.desc or ('Toggle ' .. name)

  -- Define the variable if it doesn't exist
  vim.cmd(string.format([[
    if !exists('g:%s')
      let g:%s = %s
    endif
  ]], name, name, default))

  -- Create Snacks toggle
  local toggle = Snacks.toggle({
    name = opts.label or name:gsub("_", " "):gsub("^%l", string.upper),
    get = function()
      -- Convert Vim's '0'/'1' string to boolean
      return vim.g[name] == '1' or vim.g[name] == 1
    end,
    set = function(state)
      vim.g[name] = state and '1' or '0'
    end,
  })
  if mapping then
    toggle:map(mapping, { desc = desc })
  end

  return toggle
end

NewToggle({
  name = 'cmd_auto_advance',
  default = 1,
  mapping = '<localleader>ta',
  desc = 'Toggle Auto Advance',
  label = 'Auto Advance (Line Feed)'
})
