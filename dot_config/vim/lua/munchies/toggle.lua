local M = {}

M.virtual_text = function()
  return Snacks.toggle.new({
    id = 'virtual_text',
    name = 'Virtual Text',
    get = function()
      return vim.diagnostic.config().virtual_text ~= false
    end,
    set = function(state)
      vim.diagnostic.config({ virtual_text = state })
    end,
  })
end

M.color_column = function()
  return Snacks.toggle.new({
    id = 'color_column',
    name = 'Color Column',
    get = function()
      local cc = vim.opt_local.colorcolumn:get()
      local tw = vim.bo.textwidth
      local col = tostring(tw ~= 0 and tw or 81)
      return vim.tbl_contains(cc, col)
    end,
    set = function(state)
      local tw = vim.bo.textwidth
      local col = tostring(tw ~= 0 and tw or 81)
      vim.opt_local.colorcolumn = state and col or ''
    end,
  })
end

M.translucency = function()
  local original = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
  local saved_bg = original and original.bg

  return Snacks.toggle.new({
    id = 'translucency',
    name = 'Translucency',
    get = function()
      local bg = vim.api.nvim_get_hl(0, { name = 'Normal', link = false }).bg
      return not (bg == nil or bg == 0)
    end,
    set = function(state)
      if not state then
        vim.cmd('hi Normal guibg=none')
      else
        if saved_bg then
          vim.api.nvim_set_hl(0, 'Normal', { bg = saved_bg })
        else
          vim.cmd('hi Normal guibg=#24283B')
        end
      end
    end,
  })
end

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
  vim.cmd(string.format(
    [[
    if !exists('g:%s')
      let g:%s = %s
    endif
  ]],
    name,
    name,
    default
  ))

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
