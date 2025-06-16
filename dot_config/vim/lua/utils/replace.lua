local function escape_pattern(text)
  -- Escape magic chars for `:s` command
  return text:gsub('([/\\])', '\\%1')
end

function ReplaceSelection()
  vim.cmd('normal! gv"xy')
  local sel = vim.fn.getreg('x')

  if not sel or sel == '' then
    vim.notify('No selection found', vim.log.levels.WARN)
    return
  end

  vim.ui.input({ prompt = 'Replace all instances of "' .. sel .. '" with: ' }, function(rep)
    if rep and rep ~= '' then
      local search = escape_pattern(sel)
      local replacement = escape_pattern(rep)
      local cmd = string.format('%%s/%s/%s/g', search, replacement)
      vim.cmd(cmd)
    end
  end)
end

vim.keymap.set('v', '<C-r>', ReplaceSelection, { desc = 'Replace selected text globally' })
