local function sanitize(s)
  return (s or ''):match('^[^\r\n]*'):gsub('%s+', ' '):gsub('^%s*', ''):gsub('%s*$', '')
end

local M = {}

M.linkify = function()
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)

  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selection = line:sub(start_pos[3], start_pos[2] == end_pos[2] and end_pos[3] or #line)
  local is_url = selection:match('https?://')

  local input_prompt = is_url and 'Link text: ' or 'URL (default from clipboard): '
  local default_val = is_url and nil or sanitize(vim.fn.getreg('+'))

  vim.ui.input({ prompt = input_prompt, default = default_val }, function(input)
    if not input or input == '' then
      return
    end

    local text = is_url and input or selection
    local url = is_url and selection or input
    local hyperlink = string.format('[%s](%s)', sanitize(text), url)

    vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], { hyperlink })
  end)
end

M.setup = function()
  vim.keymap.set('v', '<leader>k', M.linkify, { desc = 'Linkify visual selection' })
end

return M
