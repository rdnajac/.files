-- config/nvim/lua/config/keymaps.lua
-- some keymaps are defined in $VIMRUNTIME/lua/vim/_defaults.lua
local map = vim.keymap.set
local del = vim.keymap.del

del('n', '<leader>wd')
del('n', '<leader>wm')
del('n', '<leader>fn')
del('n', '<leader>cm')
-- del('n', '<leader>qq')

map('n', ',,', Snacks.terminal.toggle, {desc = 'Toggle Terminal'})
map({'n', 't'}, '<C-\\>', Snacks.terminal.toggle, {desc = 'Toggle Terminal'})
map('v', '<C-s>', ':sort<CR>', { desc = 'Sort selection' })
map('i', '<C-c>', 'ciw', { desc = 'Change inner word' })
map('n', 'yc','yygccp', { desc = 'Duplicate and comment out line', remap = true})

-- stylua: ignore start
local nmap = function(lhs, rhs, desc) map('n', lhs, rhs, { desc = desc }) end

nmap('<leader>w',     '<Cmd>w<CR>',             'Save File' )
nmap('zS',            vim.show_pos,             'Inspect Pos' )
nmap('gp',            '<Cmd>e <cfile>:p:h<CR>', 'Goto Parent Directory' )
nmap('>',             'V`]>',                   'Normal mode indent')
nmap('<',             'V`]<',                   'Normal mode dedent')
nmap('<Tab>',         ':bnext<CR>',             'Next Buffer')
nmap('<S-Tab>',       ':bprev<CR>',             'Previous Buffer')
nmap('<leader><Tab>', ':b#<CR>',                'Last Buffer')
nmap('<C-c>',         'ciw',                    'Change Inner Word')
nmap('<C-s>',         'viW',                    'Select Inner WORD')
-- stylua: ignore end
map('n', '<leader>-', '<C-W>s', { remap = true, desc = 'Split Window Below' })
map('n', '<leader>|', '<C-W>v', { remap = true, desc = 'Split Window Right' })

-- Resize window using <option> arrow keys (don't use LazyVim mappings)
del('n', '<C-Up>')
del('n', '<C-Down>')
del('n', '<C-Left>')
del('n', '<C-Right>')
nmap('<M-Up>', '<Cmd>resize  +2<CR>', 'Increase Window  Height')
nmap('<M-Down>', '<Cmd>resize  -2<CR>', 'Decrease Window  Height')
nmap('<M-Left>', '<Cmd>vertical resize  -2<CR>', 'Decrease Window  Width')
nmap('<M-Right>', '<Cmd>vertical resize  +2<CR>', 'Increase Window  Width')

-- import utils
local file = require('util.file')
local goto = require('util.goto')
local cd = goto.directory

-- stylua: ignore
require('which-key').add({
  {
    { mode = 'v' },
    { "<leader>d", '"_d',  desc = "delete without overwriting reg",  mode = "v" },
    { "<leader>p", '"_dP', desc = "replace without overwriting reg", mode = "v" },
  },

  { 'g%', function() cd('here') end,    desc = 'change to buffer directory' },
  { 'g$', function() cd('gitroot') end, desc = 'change to git root directory' },
  { 'g-', function() cd('last') end,    desc = 'change to last directory' },
  { 'g0', function() goto.README() end, desc = 'Goto Nearest README' },
  { '\\0', function() goto.README() end, desc = 'Goto Nearest README' },
  { 'gL', function() goto.lazy() end,  desc = 'Goto LazyVim config or module' },
  { 'gP', ':!open $(dirname %)<CR>',  desc = 'Goto Parent Directory (in finder)' },

  { '\\', group = 'Shortcuts', icon = { icon = ' ', color = 'cyan' } },
  { '\\\\', function() Snacks.dashboard.open() end, desc = 'Open Snacks Dashboard'},
  { '\\a', function() goto.conf('autocmds') end, desc = 'autocmds', icon = { icon = ' ', color = 'yellow' }},
  { '\\i', ':e ' .. vim.fn.stdpath('config') .. '/init.lua<CR>', desc = 'init.lua',  icon = { icon = ' ', color = 'red' }},
  { '\\i', function() goto.conf('init')     end, desc = 'init.lua', icon = { icon = ' ', color = 'yellow' }},
  { '\\k', function() goto.conf('keymaps')  end, desc = 'keymaps',  icon = { icon = ' ', color = 'yellow' }},
  { '\\l', function() goto.conf('lazy')     end, desc = 'lazy'},
  { '\\o', function() goto.conf('options')  end, desc = 'options',  icon = { icon = ' ', color = 'yellow' }},
  { '\\u', function() goto.conf('util')     end, desc = 'util',  icon = { icon = ' ', color = 'green' }},
  { '\\m', function() goto.conf('munchies')     end, desc = 'munchies',  icon = { icon = '🍬' } },
  { '\\s', function() goto.conf('~/.ssh/config') end, desc = 'ssh',  icon = { icon = ' ', color = 'red' }},

  { '<localleader>f', group = 'File'},
  { '<localleader>fD',  '<Cmd>Delete!<CR>', desc = 'Delete File' },
  { '<localleader>fR',  function() Snacks.rename.rename_file() end, desc = 'Rename File' },
  { '<localleader>fn', file.title, desc = 'Add file title' } ,
  { '<localleader>ft', function() goto.ft('plugin') end, desc = 'Edit after/ftplugin for current filetype' },
  { '<localleader>fs', function() goto.ft('snippets') end, desc = 'Edit snippets for current filetype' },

  { '<localleader>t', group = 'Toggle', icon = { icon = ' ', color = 'red' } },

  -- code
  { '<leader>co', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },

  -- debug
  { '<leader>dl', ':=require("lazy").plugins()<CR>', desc = 'Lazy Plugins' },
  { '<leader>ds', ':=require("snacks").meta.get()<CR>', desc = 'Snacks' },

  { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },

  -- file/find
  { '<leader>fG', function() Snacks.picker('files', {cwd = vim.fn.expand('~/GitHub/')}) end, desc = 'GitHub Repos' },
  { '<leader>fP', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Plugins' },
  { '<leader>fs', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>fL', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>fv', function() Snacks.picker('files', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>fV', function() Snacks.picker('files', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>f.', function() Snacks.picker.dotfiles() end, desc = 'Dotfiles' },
  { '<leader>f<Space>', function() Snacks.picker() end, desc = 'Pickers' },

  -- git
  { '<leader>ga', ':!git add %<CR>', desc = 'Git Add File' },

  { '<leader>o', group = 'Insert below', icon = { icon = ' ', color = 'cyan' } },
  { '<leader>ot', 'oTODO:<esc><Cmd>normal gcc<CR>A<space>',  desc = 'TODO'},
  { '<leader>ob', 'oBUG:<esc><Cmd>normal gcc<CR>A<space>',   desc = 'BUG' },
  { '<leader>oh', 'oHACK:<esc><Cmd>normal gcc<CR>A<space>',  desc = 'HACK' },
  { '<leader>of', 'oFIXME:<esc><Cmd>normal gcc<CR>A<space>', desc = 'FIXME' },

  { '<leader>O', group = 'Insert above', icon = { icon = ' ', color = 'cyan' } },
  { '<leader>Ot', 'OTODO:<esc><Cmd>normal gcc<CR>A<space>',  desc = 'TODO' },
  { '<leader>Ob', 'OBUG:<esc><Cmd>normal gcc<CR>A<space>',   desc = 'BUG' },
  { '<leader>Oh', 'OHACK:<esc><Cmd>normal gcc<CR>A<space>',  desc = 'HACK' },
  { '<leader>Of', 'OFIXME:<esc><Cmd>normal gcc<CR>A<space>', desc = 'FIXME' },

  { '<leader>q', '<Cmd>q<CR>',  desc = 'Quit Buffer' },
  { '<leader>Q', function() Snacks.bufdelete() end,  desc = 'Delete Buffer' },

  -- search
  { '<leader>sN', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>sL', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>sP', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugin File' },
  { '<leader>sv', function() Snacks.picker('grep', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>sV', function() Snacks.picker('grep', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>s.', function() Snacks.picker('grep', {cwd = vim.fn.expand('$DOTDIR'), hidden = true}) end, desc = 'Dotfiles' },
  { '<leader>s?', function() Snacks.picker.learnvimscriptthehardway() end, desc = 'Learn Vim Script the Hard Way' },

  { '<leader>z', function() Snacks.picker.zoxide() end, desc = 'Zoxide', icon = { icon = '󰄻 ' } },
  { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },

})

Snacks.toggle.option('autochdir'):map('<localleader>tc')
Snacks.toggle.option('laststatus', { off = 0, on = 3 }):map('<leader>uu')

-- stylua: ignore start
Snacks.toggle({
  name = 'Virtual Text',
  get = function() return vim.diagnostic.config().virtual_text end,
  set = function(state) vim.diagnostic.config({ virtual_text = state }) end,
}):map('<leader>uv', { desc = 'Toggle Virtual Text' })

Snacks.toggle({
  name = 'Color Column',
  get = function() return vim.opt.colorcolumn:get()[1] == '81' end,
  set = function(state) vim.opt.colorcolumn = state and '81' or '' end,
}):map('<leader>u\\', { desc = 'Toggle Color Column' })
-- stylua: ignore end

-- LazyVim has a toggle for dark background, but it doesn't do what you'd expect
del('n', '<leader>ub')
Snacks.toggle({
  name = 'Translucency',
  get = function()
    -- deprecated, use nvim_get_hl(0, { name = 'Normal' })
    return vim.api.nvim_get_hl_by_name('Normal', true).background == 0
    -- return Snacks.util.is_transparent()
  end,
  set = function(state) if state then
      vim.cmd('hi Normal guibg=#000000')
    else
      vim.cmd('hi Normal guibg=none')
    end
  end,
}):map('<leader>ub', { desc = 'Toggle Translucent Background' })
