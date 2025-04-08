local M = {}
-- Function to define toggleable vim global variables using Snacks.toggle
-- @param opts table containing:
--   name: variable name without 'g:' prefix
--   default: default value (0 or 1)
--   mapping: key mapping string (e.g. '<localleader>ta')
--   desc: description for the mapping (optional)
-- @return the Snacks toggle object
M.flag = function(opts)
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

  local toggle = Snacks.toggle({
    name = opts.label or name:gsub('_', ' '):gsub('^%l', string.upper),
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

return M
