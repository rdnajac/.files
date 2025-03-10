-- keymaps.lua
-- some keymaps are defined in /opt/nvim-macos-arm64/share/nvim/runtime/lua/vim/_defaults.lua
-- snacks keymaps are at ~/.config/nvim/lua/plugins/snacks/keys.lua
-- snacks toggles are at ~/.config/nvim/lua/plugins/snacks/toggle.lua
-- TODO: add folding to this file
local del = vim.keymap.del
local map = vim.keymap.set
local nmap = function(lhs, rhs, desc) map('n', lhs, rhs, { desc = desc }) end
local vmap = function(lhs, rhs, desc) map('v', lhs, rhs, { desc = desc }) end

vmap('<C-s>', ':sort<CR>', 'Sort selection')


del('n', '<leader>wd')
del('n', '<leader>wm')
del('n', '<leader>fn')

nmap('<leader>w', '<Cmd>w<CR>',             'Save File' )
nmap('zS',        vim.show_pos,             'Inspect Pos' )
nmap('gp',        '<Cmd>e <cfile>:p:h<CR>', 'Goto Parent Directory' )
nmap('<leader>K', '<Cmd>norm! K<CR>',       'Keywordprg' )

map('n', '<leader>-', '<C-W>s', { remap = true, desc = 'Split Window Below' })
map('n', '<leader>|', '<C-W>v', { remap = true, desc = 'Split Window Right' })

-- stylua: ignore start
-- Resize window using <option> arrow keys (don't use LazyVim mappings)
del('n', '<C-Up>')
del('n', '<C-Down>')
del('n', '<C-Left>')
del('n', '<C-Right>')
nmap('<M-Up>',    '<Cmd>resize  +2<CR>',          'Increase Window  Height' )
nmap('<M-Down>',  '<Cmd>resize  -2<CR>',          'Decrease Window  Height' )
nmap('<M-Left>',  '<Cmd>vertical resize  -2<CR>', 'Decrease Window  Width' )
nmap('<M-Right>', '<Cmd>vertical resize  +2<CR>', 'Increase Window  Width' )
-- stylua: ignore end

-- config
local quickconfig = function(file)
  local nvimconfigfiles = { 'autocmds', 'keymaps', 'lazy', 'options' }
  -- if we're in a floating window, close in first
  if vim.api.nvim_win_get_config(0).relative ~= '' then
    vim.cmd('q')
  end
  if file == 'dashboard' then
    vim.cmd('e ' .. vim.fn.stdpath('config') .. '/lua/config/snacks/dashboard.lua')
  elseif vim.tbl_contains(nvimconfigfiles, file) then
    vim.cmd('e ' .. vim.fn.stdpath('config') .. '/lua/config/' .. file .. '.lua')
  else
    vim.cmd('e ' .. vim.fn.expand(file))
  end
end

local changedir = function(where)
  local path = ''

  if where == 'gitroot' then
    local root = Snacks.git.get_root(vim.fn.expand('%:p:h'))
    if root then
      path = root
    end
  elseif where == 'here' then
    path = vim.fn.expand('%:p:h')
  elseif where == 'last' then
    path = vim.fn.expand('-')
  else
    path = where
  end

  if path ~= '' then
    vim.cmd('cd ' .. path)
  end

  vim.cmd('pwd')
end

local wk = require('which-key')
-- stylua: ignore
wk.add({
  {
    { mode = 'v' },
    { "<leader>d", '"_d',  desc = "delete without overwriting reg",  mode = "v" },
    { "<leader>p", '"_dP', desc = "replace without overwriting reg", mode = "v" },
  },

  { '\\', group = 'Shortcuts', icon = { icon = ' ', color = 'cyan' } },
  { '\\<Space>', function() Snacks.dashboard.open() end, desc = 'Open Snacks Dashboard'},
  { '\\a', function() quickconfig('autocmds') end, desc = 'autocmds', icon = { icon = ' ', color = 'yellow' }},
  { '\\k', function() quickconfig('keymaps')  end, desc = 'keymaps',  icon = { icon = ' ', color = 'yellow' }},
  { '\\l', function() quickconfig('lazy')     end, desc = 'lazy'},
  { '\\o', function() quickconfig('options')  end, desc = 'options',  icon = { icon = ' ', color = 'yellow' }},
  { '\\d', function() quickconfig('dashboard') end, desc = 'Snacks picker config' },
  { '\\s', function() quickconfig('~/.ssh/config') end, desc = 'ssh',  icon = { icon = ' ', color = 'red' }},
  { '\\i', ':e ' .. vim.fn.stdpath('config') .. '/init.lua<CR>', desc = 'init.lua',  icon = { icon = ' ', color = 'red' }},

  { ',', group = 'Utility', icon = { icon = ' ', color = 'blue' } },
  { ',%', function() changedir('here') end,    desc = 'change to buffer directory' },
  { ',$', function() changedir('gitroot') end, desc = 'change to git root directory' },
  { ',-', function() changedir('last') end,    desc = 'change to last directory' },
  { ',R',  function() Snacks.rename.rename_file() end, desc = 'Rename File' },
  { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
  { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
  { '<leader>q', function() Snacks.bufdelete() end,  desc = 'Quit Buffer' },
  { '<leader>z', function() Snacks.picker.zoxide() end, desc = 'Zoxide', icon = { icon = '󰄻 ' } },

  { '<leader>co', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },

  { '<leader>dl', ':=require("lazy").plugins()<CR>', desc = 'Lazy Plugins' },
  { '<leader>ds', ':=require("snacks").meta.get()<CR>', desc = 'Snacks' },

  { '<leader>fP', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Plugins' },
  { '<leader>fs', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>fL', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>fv', function() Snacks.picker('files', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>fV', function() Snacks.picker('files', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>f.', function() Snacks.picker.dotfiles() end, desc = 'Dotfiles' },
  { '<leader>f<Space>', function() Snacks.picker() end, desc = 'Pickers' },

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
  { '<leader>Of', function() insert_comment('FIXME', true) end, desc = 'FIXME' },

  { '<leader>sN', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>sL', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>sP', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugin File' },
  { '<leader>sv', function() Snacks.picker('grep', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>sV', function() Snacks.picker('grep', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>s.', function() Snacks.picker('grep', {cwd = vim.fn.expand('$DOTDIR'), hidden = true}) end, desc = 'Dotfiles' },

  -- https://github.com/jmbuhr/quarto-nvim-kickstarter
  { ",o", group = "[o]tter & c[o]de" },
  { ",oa", require'otter'.activate, desc = "otter [a]ctivate" },
  -- { ",ob", insert_bash_chunk, desc = "[b]ash code chunk" },
  { ",oc", "O# %%<cr>", desc = "magic [c]omment code chunk # %%" },
  { ",od", require'otter'.activate, desc = "otter [d]eactivate" },

  { ",q", group = "[q]uarto" },
  { ",qE", function() require('otter').export(true) end, desc = "[E]xport with overwrite" },
  { ",qa", ":QuartoActivate<cr>", desc = "[a]ctivate" },
  { ",qe", require('otter').export, desc = "[e]xport" },
  { ",qh", ":QuartoHelp ", desc = "[h]elp" },
  { ",qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "[p]review" },
  { ",qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "[q]uiet preview" },

  { ",qr", group = "[r]un" },
  { ",qra", ":QuartoSendAll<cr>", desc = "run [a]ll" },
  { ",qrb", ":QuartoSendBelow<cr>", desc = "run [b]elow" },
  { ",qrr", ":QuartoSendAbove<cr>", desc = "to cu[r]sor" },

  { ",x", group = "e[x]ecute" },
  { ",xx", ":w<cr>:source %<cr>", desc = "[x] source %" },

  { '<locealleader>l', group = 'vimtex', icon = { icon = ' ', color = 'yellow' } },
})

Snacks.toggle.option('laststatus', { off = 0, on = 3 }):map('<leader>uu')

Snacks.toggle({
  name = 'Virtual Text',
  get = function()
    return vim.diagnostic.config().virtual_text
  end,
  set = function(state)
    vim.diagnostic.config({ virtual_text = state })
  end,
}):map('<leader>uv', { desc = 'Toggle Virtual Text' })

Snacks.toggle({
  name = 'Color Column',
  get = function()
    return vim.opt.colorcolumn:get()[1] == '81'
  end,
  set = function(state)
    vim.opt.colorcolumn = state and '81' or ''
  end,
}):map('<leader>u\\', { desc = 'Toggle Color Column' })

-- LazyVim has a toggle for dark background, but it doesn't do what you'd expect
del('n', '<leader>ub')
Snacks.toggle({
  name = 'Translucency',
  get = function()
    -- FIXME: This is backwards
    return vim.api.nvim_get_hl_by_name('Normal', true).background == 0
  end,
  set = function(state)
    if state then
      vim.cmd('hi Normal guibg=#000000')
    else
      vim.cmd('hi Normal guibg=none')
    end
  end,
}):map('<leader>ub', { desc = 'Toggle Translucent Background' })
