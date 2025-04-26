local scriptnames = function()
  local ok, result = pcall(vim.api.nvim_exec2, 'scriptnames', { output = true })
  if not ok then
    return {}
  end

  local items = {}
  for _, line in ipairs(vim.split(result.output, '\n', { plain = true, trimempty = true })) do
    local idx, path = line:match('^%s*(%d+):%s+(.*)$')
    if idx and path then
      table.insert(items, {
        formatted = path,
        text = string.format('%3d %s', idx, path),
        file = path,
        item = path,
        idx = tonumber(idx),
      })
    end
  end

  return items
end

local M = {}

M.scriptnames = function()
  Snacks.picker.pick({
    title = 'Scriptnames',
    items = scriptnames(),
    format = function(item)
      return { { item.text } }
    end,
    -- format = 'file',
    preview = 'file',
  })
end

return M
