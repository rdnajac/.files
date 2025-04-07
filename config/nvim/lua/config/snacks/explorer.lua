---@class snacks.picker.Config
local explorer = {
  win = {
    list = {
      keys = {
        ['-'] = 'explorer_up',
        ['l'] = 'confirm',
        ['h'] = 'explorer_close',
        ['<Right>'] = 'confirm',
        ['<Left>'] = 'explorer_close',
        ['r'] = 'explorer_rename',
        ['c'] = 'explorer_copy',
        ['m'] = 'explorer_move',
        ['o'] = 'explorer_open',
        ['P'] = 'toggle_preview',
        ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
        ['p'] = 'explorer_paste',
        ['u'] = 'explorer_update',
      },
    },
  },
}

return explorer

-- hardway = {
--   finder = 'grep',
--   hidden = true,
--   ignored = true,
--   follow = false,
--   cwd = vim.fn.expand('$XDG_CONFIG_HOME/vim/docs/learnvimscriptthehardway'),
--   confirm = function(picker, item) picker:close() vim.cmd('!open ' .. Snacks.picker.util.path(item)) end,
-- },
