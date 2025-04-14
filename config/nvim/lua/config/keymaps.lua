-- NOTE: some keymaps are defined in $VIMRUNTIME/lua/vim/_defaults.lua
local map = vim.keymap.set
local nmap = function(lhs, rhs, desc) map('n', lhs, rhs, { desc = desc }) end
local del = vim.keymap.del
-- stylua: ignore

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <option> arrow keys
nmap('<M-Up>', '<Cmd>resize  +2<CR>', 'Increase Window  Height')
nmap('<M-Down>', '<Cmd>resize  -2<CR>', 'Decrease Window  Height')
nmap('<M-Left>', '<Cmd>vertical resize  -2<CR>', 'Decrease Window  Width')
nmap('<M-Right>', '<Cmd>vertical resize  +2<CR>', 'Increase Window  Width')

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- stylua: ignore start
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
-- stylua: ignore end
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- location list
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })



map({ 'n', 'i' }, '<C-c>', 'ciw', { desc = 'Change inner word' })
map('v', '<M-s>', ':sort<CR>', { desc = 'Sort selection' })
map('n', 'yc', 'yygccp', { remap = true, desc = 'Duplicate and comment out line' })
-- stylua: ignore start

nmap('zS',            vim.show_pos,             'Inspect Pos')
nmap('gp',            '<Cmd>e <cfile>:p:h<CR>', 'Goto Parent Directory')
nmap('>',             'V`]>',                   'Normal mode indent')
nmap('<',             'V`]<',                   'Normal mode dedent')
nmap('<Tab>',         ':bnext<CR>',             'Next Buffer')
nmap('<S-Tab>',       ':bprev<CR>',             'Previous Buffer')
-- nmap('<C-s>',         'viW',                    'Select Inner WORD')
-- stylua: ignore end


-- stylua: ignore
require('which-key').add({
  { '<leader>/',       LazyVim.pick('grep'),                         desc = 'Grep (Root Dir)', icon = { icon = ' ' } },
  { '<leader>.',       function() Snacks.scratch() end,              desc = 'Toggle Scratch Buffer' },
  { '<leader>>',       function() Snacks.scratch.select() end,       desc = 'Select Scratch Buffer' },
  { '<leader>e',       function() Snacks.explorer() end,             desc = 'Explorer', icon = { icon = ' ', color = 'azure' }},
  { '<leader>q',       function() Snacks.bufdelete() end,            desc = 'Delete Buffer' },
  { '<leader>n',       function() Snacks.picker.notifications() end, desc = 'Notification History' },
  { '<leader>un',      function() Snacks.notifier.hide() end,        desc = 'Dismiss All Notifications' },
  { '<leader>,',       function() Snacks.picker.buffers() end,       desc = 'Buffers' },
  { '<leader>F',       function() Snacks.picker.smart() end,         desc = 'Smart Find Files' },
  { '<leader>C',       function() Snacks.picker.colorschemes() end,  desc = 'Colorschemes', icon = { icon = ' ', color = 'yellow' } },
  { '<leader>z',       function() Snacks.picker.zoxide() end,        desc = 'Zoxide', icon = { icon = '󰄻 ' } },
  { '<leader><space>', function() Snacks.picker() end,               desc = 'Pickers', icon = { icons = ' ' } },

  -- debug
  { '<leader>db',  '<Cmd>BlinkCmp status<CR>',               desc = 'Blink' },
  { '<leader>dk',  '<Cmd>checkhealth which-key<CR>',             desc = 'Keymap Health' },
  { '<leader>dl',  '<Cmd>LazyDev lsp<CR>',                   desc = 'LSP' },
  { '<leader>ds',  '<Cmd>checkhealth snacks<CR>',                desc = 'Snacks Health' },
  { '<leader>dL',  ':=require("lazy").plugins()<CR>',        desc = 'Lazy Plugins' },
  { '<leader>dS',  ':=require("snacks").meta.get()<CR>',     desc = 'Snacks' },
  { '<leader>dps', function() Snacks.profiler.scratch() end, desc = 'Profiler Scratch Buffer' },

  { '<leader>f', group = 'file/find' },
  -- { '<leader>fb', function() Snacks.picker.buffers() end,           desc = 'Buffers' },
  -- { '<leader>fB', function() Snacks.picker.buffers({hidden = true, nofile = true}) end, desc = 'Buffers (all)' },
  { '<leader>fc', LazyVim.pick.config_files(),                       desc = 'Find Config File' },
  { '<leader>fC', function() Snacks.rename.rename_file() end,        desc = 'Change (rename) File on disk' },
  { '<leader>fD', '<Cmd>Delete!<CR>',                                desc = 'Delete File (and buffer) from disk' },
  { '<leader>fe', function() Snacks.explorer({cwd = Snacks.git.get_root()}) end, desc = 'Explorer (git root)' },
  { '<leader>fE', function() Snacks.explorer({cwd = vim.fn.expand('~/GitHub/')}) end, desc = 'Explorer (all repos)' },
  { '<leader>ff', function() Snacks.picker.files({cwd = Snacks.git.get_root()}) end, desc = 'Explorer (git root)' },
  { '<leader>fF', function() Snacks.picker.files({cwd = vim.fn.expand('~/GitHub/')}) end, desc = 'Explorer (all repos)' },
  { '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Find Files (git-files)' },
  { '<leader>fG', function() Snacks.picker.files({cwd = vim.fn.expand('~/GitHub/')}) end, desc = 'GitHub Repos' },
  { '<leader>fL', function() Snacks.picker.files({cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end, desc = 'LazyVim Files' },
  { '<leader>fn', require('util.file').title, desc = 'Add file title' } ,
  -- { '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
  { '<leader>fP', function() Snacks.picker.files({cwd = vim.fn.stdpath('data')..'/lazy'}) end, desc = 'Lazy Plugins' },
  { '<leader>fr', LazyVim.pick('recent'), desc = 'Recent' },
  { '<leader>fR', function() Snacks.picker.recent({filter = {cwd = true}}) end, desc = 'Recent (cwd)' },
  { '<leader>fs', function() Snacks.picker.files({cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim' }) end, desc = 'Snacks Files' },
  { '<leader>ft', function() require('util.goto').ft('plugin') end, desc = 'Edit after/ftplugin for current filetype' },
  { '<leader>fv', function() Snacks.picker.files({cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>fV', function() Snacks.picker.files({cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>f.', function() Snacks.picker.files({cwd = vim.fn.expand('$DOTDIR')}) end, desc = '$DOTDIR' },

  { '<leader>ga', ':!git add %<CR>', desc = 'Git Add (file)' },
  { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (hunks)' },
  { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
  { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash' },

  { '<leader>o', group = 'Insert below', icon = { icon = ' ', color = 'azure' } },
  { '<leader>ob', 'oBUG:<esc><Cmd>normal   gcc<CR>A<space>', desc = 'BUG',   icon = { icon = ' ', color = 'azure' } },
  { '<leader>of', 'oFIXME:<esc><Cmd>normal gcc<CR>A<space>', desc = 'FIXME', icon = { icon = ' ', color = 'azure' } },
  { '<leader>oh', 'oHACK:<esc><Cmd>normal  gcc<CR>A<space>', desc = 'HACK',  icon = { icon = ' ', color = 'azure' } },
  { '<leader>ot', 'oTODO:<esc><Cmd>normal  gcc<CR>A<space>', desc = 'TODO',  icon = { icon = ' ', color = 'azure' } },
  { '<leader>ow', 'oWARN:<esc><Cmd>normal  gcc<CR>A<space>', desc = 'WARN',  icon = { icon = ' ', color = 'azure' } },

  { '<leader>O', group = 'Insert above', icon = { icon = ' ', color = 'azure' } },
  { '<leader>Ob', 'OBUG:<esc><Cmd>normal   gcc<CR>A<space>', desc = 'BUG',   icon = { icon = ' ', color = 'azure' } },
  { '<leader>Of', 'OFIXME:<esc><Cmd>normal gcc<CR>A<space>', desc = 'FIXME', icon = { icon = ' ', color = 'azure' } },
  { '<leader>Oh', 'OHACK:<esc><Cmd>normal  gcc<CR>A<space>', desc = 'HACK',  icon = { icon = ' ', color = 'azure' } },
  { '<leader>Ot', 'OTODO:<esc><Cmd>normal  gcc<CR>A<space>', desc = 'TODO',  icon = { icon = ' ', color = 'azure' } },
  { '<leader>Ow', 'OWARN:<esc><Cmd>normal  gcc<CR>A<space>', desc = 'WARN',  icon = { icon = ' ', color = 'azure' } },

  { '<leader>s', group = 'search/grep' },
  { '<leader>sa', function() Snacks.picker.autocmds() end,                             desc = 'Autocmds' },
  { '<leader>sb', function() Snacks.picker.lines() end,                                desc = 'Buffer Lines' },
  { '<leader>sB', function() Snacks.picker.grep_buffers() end,                         desc = 'Grep Open Buffers' },
  { '<leader>sc', function() Snacks.picker.grep({cwd = vim.fn.stdpath('config')}) end, desc = 'Grep Config Files' },
  { '<leader>sC', function() Snacks.picker.commands() end,                             desc = 'Commands' },
  { '<leader>sd', function() Snacks.picker.diagnostics() end,                          desc = 'Diagnostics' },
  { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end,                   desc = 'Buffer Diagnostics' },
  { '<leader>sg', function() Snacks.picker.grep() end,                                 desc = 'Grep (Root Dir)' },
  { '<leader>sG', function() Snacks.picker.grep({ root = false }) end,                 desc = 'Grep (cwd)' },
  { '<leader>sh', function() Snacks.picker.help() end,                                 desc = 'Help Pages' },
  { '<leader>sH', function() Snacks.picker.highlights() end,                           desc = 'Highlights' },
  { '<leader>si', function() Snacks.picker.icons() end,                                desc = 'Icons' },
  { '<leader>sj', function() Snacks.picker.jumps() end,                                desc = 'Jumps' },
  { '<leader>sk', function() Snacks.picker.keymaps() end,                              desc = 'Keymaps' },
  { '<leader>sl', function() Snacks.picker.loclist() end,                              desc = 'Location List' },
  { '<leader>sL', function() Snacks.picker.grep({cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim' }) end,    desc = 'LazyVim File' },
  { '<leader>sM', function() Snacks.picker.man() end,                                  desc = 'Man Pages' },
  { '<leader>sm', function() Snacks.picker.marks() end,                                desc = 'Marks' },
  -- <leader>sn is reserved for noice
  { '<leader>sN', function() Snacks.picker.grep({cwd = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'}) end, desc = 'Snacks File' },
  { '<leader>sp', function() Snacks.picker.lazy() end,                                 desc = 'Search for Plugin Spec' },
  { '<leader>sP', function() Snacks.picker.grep({cwd = vim.fn.stdpath('data') .. '/lazy'}) end,             desc = 'Lazy Plugin File' },
  { '<leader>sq', function() Snacks.picker.qflist() end,                               desc = 'Quickfix List' },
  { '<leader>sR', function() Snacks.picker.resume() end,                               desc = 'Resume' },
  { '<leader>su', function() Snacks.picker.undo() end,                                 desc = 'Undotree' },
  { '<leader>sv', function() Snacks.picker.grep({cwd = vim.fn.expand('~/.config/vim')}) end, desc = 'Find Vim Config File' },
  { '<leader>sV', function() Snacks.picker.grep({cwd = vim.fn.expand('$VIMRUNTIME')}) end, desc = '$VIMRUNTIME' },
  { '<leader>sw', LazyVim.pick('grep_word'),                                           desc = 'Visual selection or word (Root Dir)', mode = { 'n',                            'x' } },
  { '<leader>sW', LazyVim.pick('grep_word', { root = false }),                         desc = 'Visual selection or word (cwd)', mode = { 'n', 'x' } },
  { '<leader>s.', function() Snacks.picker('grep',{cwd = vim.fn.expand('$DOTDIR'), hidden = true}) end, desc = 'Dotfiles' },
  { '<leader>s:', function() Snacks.picker.command_history() end,                      desc = 'Command History' },
  { '<leader>s"', function() Snacks.picker.registers() end,                            desc = 'Registers' },
  { '<leader>s/', function() Snacks.picker.search_history() end,                       desc = 'Search History' },
  { '<leader>s?', function() Snacks.picker.hardway() end, desc = 'Learn Vim Script the Hard Way' },

  {
    { mode = 'v' },
    { '<leader>d', '"_d',  desc = 'delete without overwriting reg',  mode = 'v' },
    { '<leader>p', '"_dP', desc = 'replace without overwriting reg', mode = 'v' },
  },

})

-- stylua: ignore start
LazyVim.format.snacks_toggle():map("<leader>uf")
LazyVim.format.snacks_toggle(true):map("<leader>uF")
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.profiler_highlights():map("<leader>dph")
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")
-- stylua: ignore end

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
  map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
  map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
  map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
end

map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
map({"n", "x" }, "<leader>gY", function()
  Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })
Snacks.toggle.option('autochdir'):map('<leader>ta')
Snacks.toggle.option('list'):map('<leader>u?')
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
Snacks.toggle({
  name = 'Translucency',
  get = function()
    -- deprecated, use nvim_get_hl(0, { name = 'Normal' })
    return vim.api.nvim_get_hl_by_name('Normal', true).background == 0
    -- return Snacks.util.is_transparent()
  end,
  set = function(state)
    if state then
      vim.cmd('hi Normal guibg=#000000')
    else
      vim.cmd('hi Normal guibg=none')
    end
  end,
}):map('<leader>uB', { desc = 'Toggle Translucent Background' })
