---@param trigger string trigger string for snippet
---@param body string snippet text that will be expanded
---@param opts? vim.keymap.set.Opts
---
function vim.snippet.add(trigger, body, opts)
  -- BUG: ia doesn't work, but 'i' does
  -- vim.keymap.set('ia', trigger, function()
  vim.keymap.set('i', trigger, function()
    local c = vim.fn.nr2char(vim.fn.getchar(0))
    if c ~= '\t' then
      vim.api.nvim_feedkeys(trigger .. c, 'i', true)
      return
    end
    vim.snippet.expand(body)
  end, opts)
end

vim.keymap.set('i', '(', function()
  vim.snippet.expand('(${1})$0')
end, {})
