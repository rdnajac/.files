-- keymaps.lua
-- some keymaps are defined in /opt/nvim-macos-arm64/share/nvim/runtime/lua/vim/_defaults.lua
-- snacks keymaps are at ~/.config/nvim/lua/plugins/snacks/keys.lua
-- snacks toggles are at ~/.config/nvim/lua/plugins/snacks/toggle.lua
local map = vim.keymap.set

-- Check if there is a map set for <C-s> to determine whether LazyVim keymaps are loaded
-- map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

map('n', '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save File' })
map('n', '<leader>Q', '<cmd>qa<cr>', { desc = 'Quit All' })
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })
map('n', 'zS', vim.show_pos, { desc = 'Inspect Pos' })
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
map('n', '<leader>uI', '<cmd>InspectTree<cr>', { desc = 'Inspect Tree' })
map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })

-- stylua: ignore start
map('n', '<leader>q', function() Snacks.bufdelete() end, { desc = 'Quit Buffer' })

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'",      { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'",      { desc = 'Up',   expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>',   "v:count == 0 ? 'gk' : 'k'", { desc = 'Up',   expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window',  remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>',    '<cmd>resize  +2<cr>',          { desc = 'Increase Window Height' })
map('n', '<C-Down>',  '<cmd>resize  -2<cr>',          { desc = 'Decrease Window Height' })
map('n', '<C-Left>',  '<cmd>vertical resize  -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize  +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]",      { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]",      { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]",      { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]",      { expr = true, desc = 'Prev Search Result' })
-- stylua: ignore end

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- config
local nvimconfigfiles = { 'autocmds', 'keymaps', 'lazy', 'options' }
local quickconfig = function(file)
  -- if were in a floating window, close in first
  if vim.api.nvim_win_get_config(0).relative ~= '' then
    vim.cmd('q')
  end
  if vim.tbl_contains(nvimconfigfiles, file) then
    vim.cmd('e ' .. vim.fn.stdpath('config') .. '/lua/config/' .. file .. '.lua')
  else
    vim.cmd('e ' .. vim.fn.expand(file))
  end
end

local wk = require('which-key')
-- stylua: ignore
wk.add({
  { '!', group = 'Commands', icon = { icon = ' ', color = 'red' } },
  { '!cd', ':!cd $(dirname %)<CR>', desc = 'cd here' },

-- for more git keymaps see ~/.config/nvim/lua/plugins/snacks/keys.lua
  { '<leader>g', group = 'git' },
  { '<leader>ga', ':!git add %<CR>', desc = 'Git Add File' },

  { '\\', group = 'Shortcuts', icon = { icon = ' ', color = 'cyan' } },
  { '\\<Space>', function() Snacks.dashboard.open() end, desc = 'Open Snacks Dashboard'},
  { '\\a', function() quickconfig('autocmds') end, desc = 'autocmds', icon = { icon = ' ', color = 'yellow' }},
  { '\\k', function() quickconfig('keymaps')  end, desc = 'keymaps',  icon = { icon = ' ', color = 'yellow' }},
  { '\\l', function() quickconfig('lazy')     end, desc = 'lazy'},
  { '\\o', function() quickconfig('options')  end, desc = 'options',  icon = { icon = ' ', color = 'yellow' }},
  { '\\s', function() quickconfig('~/.ssh/config') end, desc = 'ssh',  icon = { icon = ' ', color = 'red' }},
  { '\\i', ':e ' .. vim.fn.stdpath('config') .. '/init.lua<CR>', desc = 'init.lua',  icon = { icon = ' ', color = 'red' }},

  { '\\v', group = 'Vim' },
  { '\\vv', function() quickconfig('~/.vim/plugin/init.vim') end, desc = 'Vim Settings',  icon = { icon = ' ', color = 'red' }},
  { '\\vf', function() Snacks.picker('files', {cwd = vim.fn.expand('~/.vim')}) end, desc = 'Vim Files' },
  { '\\vr', function() Snacks.picker('files', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },

  { '<leader>o', group = 'Insert below', icon = { icon = ' ', color = 'cyan' } },
  { '<leader>ot', 'oTODO:<esc>gccA<space>', desc = 'Insert TODO' },
  { '<leader>ob', 'oBUG:<esc>gccA<space>', desc = 'Insert BUG' },
  { '<leader>oh', 'oHACK:<esc>gccA<space>', desc = 'Insert HACK' },

  { '<leader>O', group = 'Insert above', icon = { icon = ' ', color = 'cyan' } },
  { '<leader>Ot', 'OTODO:<esc>gccA<space>', desc = 'Insert TODO' },
  { '<leader>Ob', 'OBUG:<esc>gccA<space>', desc = 'Insert BUG' },
  { '<leader>Oh', 'OHACK:<esc>gccA<space>', desc = 'Insert HACK' },
})

