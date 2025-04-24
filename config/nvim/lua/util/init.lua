-- silence checkhealth errors
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- set up global debug functions
_G.dd = function(...)
  Snacks.debug.inspect(...)
end

_G.bt = function()
  Snacks.debug.backtrace()
end

-- Override print to use snacks for `:=` command
vim.print = _G.dd

_G.warn = function(msg)
  vim.notify(msg, vim.log.levels.WARN)
end

-- configure filetype detection
vim.filetype.add({ pattern = { ['.*/git/config'] = 'gitconfig' } })
vim.filetype.add({
  pattern = {
    ['.*/tmux/.*%.conf'] = { 'tmux', { priority = 1 } },
    ['^%.?tmux.*%.conf'] = { 'tmux', { priority = -1 } },
  },
})

-- set up utilities
require('util.goto').setup()
require('util.file').setup()
require('util.ooze').setup()
require("util.link").setup()

local function escape_pattern(text)
  -- Escape magic chars for `:s` command
  return text:gsub("([/\\])", "\\%1")
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
