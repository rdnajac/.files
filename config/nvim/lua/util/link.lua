local M = {}

M.linkify = function()
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)

  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selection = line:sub(start_pos[3], end_pos[3])
  local is_url = selection:match('https?://')

  if is_url then
    vim.ui.input({ prompt = 'Link text: ' }, function(input)
      if not input or input == '' then
        return
      end
      local formatted = string.format('[%s](%s)', input, selection)
      vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], { formatted })
    end)
  else
    local clipboard = vim.fn.getreg('+')
    vim.ui.input({ prompt = 'URL (default from clipboard): ', default = clipboard }, function(input)
      if not input or input == '' then
        return
      end
      local formatted = string.format('[%s](%s)', selection, input)
      vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], { formatted })
    end)
  end
end

M.setup = function()
  vim.keymap.set('v', '<leader>k', M.linkify, { desc = 'Linkify visual selection' })
end

return M
