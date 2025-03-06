-- keymaps.lua
-- some keymaps are defined in /opt/nvim-macos-arm64/share/nvim/runtime/lua/vim/_defaults.lua
-- snacks keymaps are at ~/.config/nvim/lua/plugins/snacks/keys.lua
-- snacks toggles are at ~/.config/nvim/lua/plugins/snacks/toggle.lua
-- TODO: add folding to this file
local map = vim.keymap.set

-- Check if there is a map set for <C-s> to determine whether LazyVim keymaps are loaded
-- map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

map('n', 'gp', '<cmd>e <cfile>:p:h<CR>', { desc = 'Goto Parent Directory' })

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

-- Resize window using <option> arrow keys
map('n', '<M-Up>',    '<cmd>resize  +2<cr>',          { desc = 'Increase Window Height' })
map('n', '<M-Down>',  '<cmd>resize  -2<cr>',          { desc = 'Decrease Window Height' })
map('n', '<M-Left>',  '<cmd>vertical resize  -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<M-Right>', '<cmd>vertical resize  +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==",                   { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",             { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi',                                   { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi',                                   { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",       { desc = 'Move Down' })
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
local quickconfig = function(file)
  local nvimconfigfiles = { 'autocmds', 'keymaps', 'lazy', 'options' }
  -- if we're in a floating window, close in first
  if vim.api.nvim_win_get_config(0).relative ~= '' then
    vim.cmd('q')
  end
  if file == 'pickers' then
    vim.cmd('e ' .. vim.fn.stdpath('config') .. '/lua/config/snacks/picker.lua')
  elseif file == 'dashboard' then
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
  { 'gc', hidden = true },

  { '\\', group = 'Shortcuts', icon = { icon = ' ', color = 'cyan' } },
  { '\\<Space>', function() Snacks.dashboard.open() end, desc = 'Open Snacks Dashboard'},
  { '\\a', function() quickconfig('autocmds') end, desc = 'autocmds', icon = { icon = ' ', color = 'yellow' }},
  { '\\k', function() quickconfig('keymaps')  end, desc = 'keymaps',  icon = { icon = ' ', color = 'yellow' }},
  { '\\l', function() quickconfig('lazy')     end, desc = 'lazy'},
  { '\\o', function() quickconfig('options')  end, desc = 'options',  icon = { icon = ' ', color = 'yellow' }},
  { '\\p', function() quickconfig('picker')   end, desc = 'Snacks dashboard config' },
  { '\\d', function() quickconfig('dashboard') end, desc = 'Snacks picker config' },
  { '\\s', function() quickconfig('~/.ssh/config') end, desc = 'ssh',  icon = { icon = ' ', color = 'red' }},
  { '\\i', ':e ' .. vim.fn.stdpath('config') .. '/init.lua<CR>', desc = 'init.lua',  icon = { icon = ' ', color = 'red' }},

  { ',', group = 'Utility', icon = { icon = ' ', color = 'blue' } },
  { ',%', function() changedir('here') end,    desc = 'change to buffer directory' },
  { ',$', function() changedir('gitroot') end, desc = 'change to git root directory' },
  { ',-', function() changedir('last') end,    desc = 'change to last directory' },

  { '<leader><space>', function() Snacks.picker.smart() end,     desc = 'Smart Find Files' },
  { '<leader>,', function() Snacks.picker.buffers() end,         desc = 'Buffers' },
  { '<leader>/', function() Snacks.picker.grep() end,            desc = 'Grep' },
  { '<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History' },
  { '<leader>e', function() Snacks.explorer() end,               desc = 'File Explorer' },
  { '<leader>z', function() Snacks.picker.zoxide() end, desc = 'Zoxide', icon = { icon = '󰄻 ' } },

  -- buffer
  { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
  { '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' } },
  { '<leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Delete Other Buffers' }},

  -- code
  { '<leader>cR',  function() Snacks.rename.rename_file() end, desc = 'Rename File' },

  -- debug
  { '<leader>dl', ':=require("lazy").plugins()<CR>', desc = 'Lazy Plugins' },
  { '<leader>ds', ':=require("snacks").meta.get()<CR>', desc = 'Snacks' },

  -- find
  { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
  { "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
  { '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Neovim Config File' },
  -- { '<leader>fc', function() Snacks.picker.grep({ cwd = vim.fn.stdpath('config') }) end, desc = 'Neovim Config File' },
  { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
  { "<leader>fF", function() Snacks.picker.files({ root = false }) end, desc = "Find Files (cwd)" },
  { '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Git Files' },
  { '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
  { '<leader>fP', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Plugins' },
  { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },
  { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent (cwd)" },
  -- mine
  { '<leader>f<Space>', function() Snacks.picker() end, desc = 'Pickers' },
  { '<leader>fs', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>fL', function() Snacks.picker('files', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>fv', function() Snacks.picker('files', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>fV', function() Snacks.picker('files', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>f.', function() Snacks.picker.dotfiles() end, desc = 'Dotfiles' },

  -- git
  { '<leader>ga', ':!git add %<CR>', desc = 'Git Add File' },
  { '<leader>gb', function() Snacks.git.blame_line() end,      desc = 'Git Blame Line' },
  { '<leader>gB', function() Snacks.gitbrowse() end,           desc = 'Git Browse', mode = { 'n', 'v' } },
  { '<leader>gC', function() Snacks.picker.git_log() end,      desc = 'Git Log' },
  { '<leader>gd', function() Snacks.picker.git_diff() end,     desc = 'Git Diff (Hunks)' },
  { '<leader>gf', function() Snacks.lazygit.log_file() end,    desc = 'Lazygit Current File History' },
  { '<leader>gg', function() Snacks.lazygit() end,             desc = 'Lazygit' },
  { '<leader>gl', function() Snacks.picker.git_log() end,      desc = 'Git Log' },
  { '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
  { '<leader>gs', function() Snacks.picker.git_status() end,   desc = 'Git Status' },
  { '<leader>gS', function() Snacks.picker.git_stash() end,    desc = 'Git Stash' },

  -- oOoooOOOooO
  { '<leader>o', group = 'Insert below', icon = { icon = ' ', color = 'cyan' } },
  { '<leader>ot', 'oTODO:<esc><cmd>normal gcc<cr>A<space>',  desc = 'TODO'},
  { '<leader>ob', 'oBUG:<esc><cmd>normal gcc<cr>A<space>',   desc = 'BUG' },
  { '<leader>oh', 'oHACK:<esc><cmd>normal gcc<cr>A<space>',  desc = 'HACK' },
  { '<leader>of', 'oFIXME:<esc><cmd>normal gcc<cr>A<space>', desc = 'FIXME' },

  { '<leader>O', group = 'Insert above', icon = { icon = ' ', color = 'cyan' } },
  { '<leader>Ot', 'OTODO:<esc><cmd>normal gcc<cr>A<space>',  desc = 'TODO' },
  { '<leader>Ob', 'OBUG:<esc><cmd>normal gcc<cr>A<space>',   desc = 'BUG' },
  { '<leader>Oh', 'OHACK:<esc><cmd>normal gcc<cr>A<space>',  desc = 'HACK' },
  { '<leader>Of', 'OFIXME:<esc><cmd>normal gcc<cr>A<space>', desc = 'FIXME' },

  -- search/grep
  { '<leader>s"', function() Snacks.picker.registers() end,          desc = 'Registers' },
  { '<leader>s/', function() Snacks.picker.search_history() end,     desc = 'Search History' },
  { '<leader>sa', function() Snacks.picker.autocmds() end,           desc = 'Autocmds' },
  { '<leader>sb', function() Snacks.picker.lines() end,              desc = 'Buffer Lines' },
  { '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
  { '<leader>sc', function() Snacks.picker.command_history() end,    desc = 'Command History' },
  { '<leader>sC', function() Snacks.picker.commands() end,           desc = 'Commands' },
  { '<leader>sd', function() Snacks.picker.diagnostics() end,        desc = 'Diagnostics' },
  { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },
  { '<leader>sh', function() Snacks.picker.help() end,               desc = 'Help Pages' },
  { '<leader>sg', function() Snacks.picker.grep() end,         desc = 'Grep' },
  { '<leader>sH', function() Snacks.picker.highlights() end,         desc = 'Highlights' },
  { '<leader>si', function() Snacks.picker.icons() end,              desc = 'Icons' },
  { '<leader>sj', function() Snacks.picker.jumps() end,              desc = 'Jumps' },
  { '<leader>sk', function() Snacks.picker.keymaps() end,            desc = 'Keymaps' },
  { '<leader>sl', function() Snacks.picker.loclist() end,            desc = 'Location List' },
  { '<leader>sm', function() Snacks.picker.marks() end,              desc = 'Marks' },
  { '<leader>sM', function() Snacks.picker.man() end,                desc = 'Man Pages' },
  { '<leader>sp', function() Snacks.picker.lazy() end,               desc = 'Search for Plugin Spec' },
  { '<leader>sq', function() Snacks.picker.qflist() end,             desc = 'Quickfix List' },
  { '<leader>sR', function() Snacks.picker.resume() end,             desc = 'Resume' },
  { '<leader>su', function() Snacks.picker.undo() end,               desc = 'Undo History' },
  { '<leader>sw', function() Snacks.picker.grep_word() end,    desc = 'Visual selection or word', mode = { 'n', 'x' } },
  { '<leader>sv', function() Snacks.picker('grep', {cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>sV', function() Snacks.picker('grep', {cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>co', function() Snacks.picker.colorschemes() end,       desc = 'Colorschemes' },
  -- mine
  { '<leader>sN', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks File' },
  { '<leader>sL', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim File' },
  { '<leader>sP', function() Snacks.picker('grep', {cwd = vim.fn.stdpath('data') .. '/lazy' }) end, desc = 'Lazy Plugin File' },
  { '<leader>s.', function() Snacks.picker('grep', {cwd = vim.fn.expand('$DOTDIR'), hidden = true}) end, desc = 'Dotfiles' },

  -- LSP
  { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
  { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
  { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
  { 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
  { 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
  { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
  { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },

  { '<leader>fT', function() Snacks.terminal() end,  desc = 'Terminal (cwd)'  },
  { '<leader>ft', function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, desc = 'Terminal (Root Dir)'  },
  { '<c-/>',      function() Snacks.terminal() end, desc = 'Togle Terminal' }, -- BUG: this isn't working
  { '<c-_>',      function() Snacks.terminal() end, desc = 'which_key_ignore' },

  { ']]',         function() Snacks.words.jump(vim.v.count1) end, desc = 'Next Reference', mode = { 'n', 't' } },
  { '[[',         function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
  {
    '<leader>N',
    desc = 'Neovim News',
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = 'yes',
          statuscolumn = ' ',
          conceallevel = 3,
        },
      })
    end,
  },
  { '<locealleader>l', group = 'vimtex', icon = { icon = ' ', color = 'yellow' } },
})

-- toggles
Snacks.toggle.animate():map('<leader>ua')
Snacks.toggle.diagnostics():map('<leader>ud')
Snacks.toggle.dim():map('<leader>uD')
Snacks.toggle.line_number():map('<leader>ul')
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
Snacks.toggle.option('laststatus', { off = 0, on = 3 }):map('<leader>uu')
Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
Snacks.toggle.zoom():map('<leader>uZ')
Snacks.toggle.zen():map('<leader>uz')
Snacks.toggle.treesitter():map('<leader>uT')
Snacks.toggle.indent():map('<leader>ug')
Snacks.toggle.scroll():map('<leader>uS')
-- stylua: ignore start
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = 'Conceal Level' }):map('<leader>uc')
Snacks.toggle.option('showtabline', { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = 'Tabline' }):map('<leader>uA')
-- stylua: ignore end

Snacks.toggle.profiler():map('<leader>dpp')
Snacks.toggle.profiler_highlights():map('<leader>dph')

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map('<leader>uh')
end

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

Snacks.toggle({
  name = 'Translucency',
  get = function()
    return vim.api.nvim_get_hl_by_name('Normal', true).background == 0
  end,
  set = function(state)
    if state then
      vim.cmd('hi Normal guibg=#000000')
    else
      vim.cmd('hi Normal guibg=none')
    end
  end,
}):map('<leader>b', { desc = 'Toggle Highlight Normal Background' })

