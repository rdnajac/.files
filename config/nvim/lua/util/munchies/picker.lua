local M = {}

M.scriptnames = function()
  vim.cmd('redir => g:__scriptnames_out | silent! scriptnames | redir END')
  local out = vim.g.__scriptnames_out or ''
  vim.g.__scriptnames_out = nil
  -- local out = vim.api.nvim_exec2("silent! scriptnames", { output = true }).output

  local items = {}
  for _, line in ipairs(vim.split(out, '\n', { plain = true, trimempty = true })) do
    local idx = line:match('^%s*(%d+):')
    local path = line:match(':%s+(.*)$')
    local padded_idx = #idx == 1 and ' ' .. idx or idx
    if idx and path then
      table.insert(items, {
        formatted = path,
        text = padded_idx .. " " .. path,
        file = path,
        item = path,
        idx = tonumber(idx),
      })
    end
  end
  return items
end

return M
