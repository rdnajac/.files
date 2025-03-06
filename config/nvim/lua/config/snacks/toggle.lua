-- lua/plugins/snacks/toggle.lua

-- TODO: define a function for defining `let g:` flag variable toggles

-- TODO:
-- Snacks.toggle({
--   name = 'Send Line on <CR>',
--   get = function()
--     -- check if there is a keymap for SendLine
--     -- return vim.opt.colorcolumn:get()[1] == '81'
--   end,
--   set = function(state)
--     vim.opt.colorcolumn = state and '81' or ''
--   end,
-- }):map('<leader>u\\', { desc = 'Toggle Color Column' })

Snacks.toggle({
  name = 'Auto Advance (Line Feed)',
  get = function()
    return vim.g.cmd_auto_advance == '1'
  end,
  set = function(state)
    vim.g.cmd_auto_advance = state and '1' or '0'
  end,
}):map('<localleader>ta', { desc = 'Toggle Auto Advance' })

