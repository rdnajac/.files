-- https://github.com/jmbuhr/quarto-nvim-kickstarter
--- Send code to terminal with vim-slime
--- If an R terminal has been opend, this is in r_mode
--- and will handle python code via reticulate when sent
--- from a python chunk.
--- TODO: incorpoarate this into quarto-nvim plugin
--- such that QuartoRun functions get the same capabilities
--- TODO: figure out bracketed paste for reticulate python repl.
local function send_cell()
  if vim.b['quarto_is_r_mode'] == nil then
    vim.fn['slime#send_cell']()
    return
  end
  if vim.b['quarto_is_r_mode'] == true then
    vim.g.slime_python_ipython = 0
    local is_python = require('otter.tools.functions').is_otter_language_context 'python'
    if is_python and not vim.b['reticulate_running'] then
      vim.fn['slime#send']('reticulate::repl_python()' .. '\r')
      vim.b['reticulate_running'] = true
    end
    if not is_python and vim.b['reticulate_running'] then
      vim.fn['slime#send']('exit' .. '\r')
      vim.b['reticulate_running'] = false
    end
    vim.fn['slime#send_cell']()
  end
end

--- Send code to terminal with vim-slime
--- If an R terminal has been opend, this is in r_mode
--- and will handle python code via reticulate when sent
--- from a python chunk.
local slime_send_region_cmd = ':<C-u>call slime#send_op(visualmode(), 1)<CR>'
slime_send_region_cmd = vim.api.nvim_replace_termcodes(slime_send_region_cmd, true, false, true)
local function send_region()
  -- if filetyps is not quarto, just send_region
  if vim.bo.filetype ~= 'quarto' or vim.b['quarto_is_r_mode'] == nil then
    vim.cmd('normal' .. slime_send_region_cmd)
    return
  end
  if vim.b['quarto_is_r_mode'] == true then
    vim.g.slime_python_ipython = 0
    local is_python = require('otter.tools.functions').is_otter_language_context 'python'
    if is_python and not vim.b['reticulate_running'] then
      vim.fn['slime#send']('reticulate::repl_python()' .. '\r')
      vim.b['reticulate_running'] = true
    end
    if not is_python and vim.b['reticulate_running'] then
      vim.fn['slime#send']('exit' .. '\r')
      vim.b['reticulate_running'] = false
    end
    vim.cmd('normal' .. slime_send_region_cmd)
  end
end

-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
nmap('<c-cr>', send_cell)
nmap('<s-cr>', send_cell)
imap('<c-cr>', send_cell)
imap('<s-cr>', send_cell)

--- Show R dataframe in the browser
-- might not use what you think should be your default web browser
-- because it is a plain html file, not a link
-- see https://askubuntu.com/a/864698 for places to look for
local function show_r_table()
  local node = vim.treesitter.get_node { ignore_injections = false }
  assert(node, 'no symbol found under cursor')
  local text = vim.treesitter.get_node_text(node, 0)
  local cmd = [[call slime#send("DT::datatable(]] .. text .. [[)" . "\r")]]
  vim.cmd(cmd)
end

local is_code_chunk = function()
  local current, _ = require('otter.keeper').get_current_language_context()
  if current then
    return true
  else
    return false
  end
end

--- Insert code chunk of given language
--- Splits current chunk if already within a chunk
--- @param lang string
local insert_code_chunk = function(lang)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'n', true)
  local keys
  if is_code_chunk() then
    keys = [[o```<cr><cr>```{]] .. lang .. [[}<esc>o]]
  else
    keys = [[o```{]] .. lang .. [[}<cr>```<esc>O]]
  end
  keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(keys, 'n', false)
end

local insert_r_chunk = function()
  insert_code_chunk 'r'
end

local insert_py_chunk = function()
  insert_code_chunk 'python'
end

local insert_lua_chunk = function()
  insert_code_chunk 'lua'
end

local insert_julia_chunk = function()
  insert_code_chunk 'julia'
end

local insert_bash_chunk = function()
  insert_code_chunk 'bash'
end

local insert_ojs_chunk = function()
  insert_code_chunk 'ojs'
end

--show kepbindings with whichkey
--add your own here if you want them to
--show up in the popup as well

-- normal mode
wk.add({
    { "<c-LeftMouse>", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "go to definition" },
    { "<c-q>", "<cmd>q<cr>", desc = "close buffer" },
    { "<cm-i>", insert_py_chunk, desc = "python code chunk" },
    { "<esc>", "<cmd>noh<cr>", desc = "remove search highlight" },
    { "<m-I>", insert_py_chunk, desc = "python code chunk" },
    { "<m-i>", insert_r_chunk, desc = "r code chunk" },
    { "[q", ":silent cprev<cr>", desc = "[q]uickfix prev" },
    { "]q", ":silent cnext<cr>", desc = "[q]uickfix next" },
    { "gN", "Nzzzv", desc = "center search" },
    { "gf", ":e <cfile><CR>", desc = "edit file" },
    { "gl", "<c-]>", desc = "open help link" },
    { "n", "nzzzv", desc = "center search" },
    { "z?", ":setlocal spell!<cr>", desc = "toggle [z]pellcheck" },
    { "zl", ":Telescope spell_suggest<cr>", desc = "[l]ist spelling suggestions" },
}, { mode = 'n', silent = true })

-- visual mode
wk.add({
    {
      mode = { "v" },
      { ".", ":norm .<cr>", desc = "repat last normal mode command" },
      { "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", desc = "move line down" },
      { "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", desc = "move line up" },
      { "<cr>", send_region, desc = "run code region" },
      { "q", ":norm @q<cr>", desc = "repat q macro" },
    },
})

-- visual with <leader>
wk.add({
    { "<leader>d", '"_d', desc = "delete without overwriting reg", mode = "v" },
    { "<leader>p", '"_dP', desc = "replace without overwriting reg", mode = "v" },
}, { mode = 'v' })

-- insert mode
wk.add({
    {
      mode = { "i" },
      { "<c-x><c-x>", "<c-x><c-o>", desc = "omnifunc completion" },
      { "<cm-i>", insert_py_chunk, desc = "python code chunk" },
      { "<m-->", " <- ", desc = "assign" },
      { "<m-I>", insert_py_chunk, desc = "python code chunk" },
      { "<m-i>", insert_r_chunk, desc = "r code chunk" },
      { "<m-m>", " |>", desc = "pipe" },
    },
}, { mode = 'i' })

local function new_terminal(lang)
  vim.cmd('vsplit term://' .. lang)
end

local function new_terminal_python()
  new_terminal 'python'
end

local function new_terminal_r()
  new_terminal 'R --no-save'
end

local function new_terminal_ipython()
  new_terminal 'ipython --no-confirm-exit'
end

local function new_terminal_julia()
  new_terminal 'julia'
end

local function new_terminal_shell()
  new_terminal '$SHELL'
end

local function get_otter_symbols_lang()
  local otterkeeper = require'otter.keeper'
  local main_nr = vim.api.nvim_get_current_buf()
  local langs = {}
  for i,l in ipairs(otterkeeper.rafts[main_nr].languages) do
    langs[i] = i .. ': ' .. l
  end
  -- promt to choose one of langs
  local i = vim.fn.inputlist(langs)
  local lang = otterkeeper.rafts[main_nr].languages[i]
  local params = {
    textDocument = vim.lsp.util.make_text_document_params(),
    otter = {
      lang = lang
    }
  }
  -- don't pass a handler, as we want otter to use it's own handlers
  vim.lsp.buf_request(main_nr, ms.textDocument_documentSymbol, params, nil)
end

vim.keymap.set("n", "<leader>os", get_otter_symbols_lang, {desc = "otter [s]ymbols"})


-- normal mode with <leader>
wk.add({
  {
    { "<leader><cr>", send_cell, desc = "run code cell" },
    { "<leader>c", group = "[c]ode / [c]ell / [c]hunk" },
    { "<leader>ci", new_terminal_ipython, desc = "new [i]python terminal" },
    { "<leader>cj", new_terminal_julia, desc = "new [j]ulia terminal" },
    { "<leader>cn", new_terminal_shell, desc = "[n]ew terminal with shell" },
    { "<leader>cp", new_terminal_python, desc = "new [p]ython terminal" },
    { "<leader>cr", new_terminal_r, desc = "new [R] terminal" },
    { "<leader>d", group = "[d]ebug" },
    { "<leader>dt", group = "[t]est" },
    { "<leader>e", group = "[e]dit" },
    { "<leader>f", group = "[f]ind (telescope)" },
    { "<leader>f<space>", "<cmd>Telescope buffers<cr>", desc = "[ ] buffers" },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "[M]an pages" },
    { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[b]uffer fuzzy find" },
    { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "git [c]ommits" },
    { "<leader>fd", "<cmd>Telescope buffers<cr>", desc = "[d] buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]iles" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[g]rep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[h]elp" },
    { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "[j]umplist" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[k]eymaps" },
    { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "[l]oclist" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "[m]arks" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "[q]uickfix" },
    { "<leader>g", group = "[g]it" },
    { "<leader>gb", group = "[b]lame" },
    { "<leader>gbb", ":GitBlameToggle<cr>", desc = "[b]lame toggle virtual text" },
    { "<leader>gbc", ":GitBlameCopyCommitURL<cr>", desc = "[c]opy" },
    { "<leader>gbo", ":GitBlameOpenCommitURL<cr>", desc = "[o]pen" },
    { "<leader>gc", ":GitConflictRefresh<cr>", desc = "[c]onflict" },
    { "<leader>gd", group = "[d]iff" },
    { "<leader>gdc", ":DiffviewClose<cr>", desc = "[c]lose" },
    { "<leader>gdo", ":DiffviewOpen<cr>", desc = "[o]pen" },
    { "<leader>gs", ":Gitsigns<cr>", desc = "git [s]igns" },
    { "<leader>gwc", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", desc = "worktree create" },
    { "<leader>gws", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "worktree switch" },
    { "<leader>h", group = "[h]elp / [h]ide / debug" },
    { "<leader>hc", group = "[c]onceal" },
    { "<leader>hch", ":set conceallevel=1<cr>", desc = "[h]ide/conceal" },
    { "<leader>hcs", ":set conceallevel=0<cr>", desc = "[s]how/unconceal" },
    { "<leader>ht", group = "[t]reesitter" },
    { "<leader>htt", vim.treesitter.inspect_tree, desc = "show [t]ree" },
    { "<leader>i", group = "[i]mage" },
    { "<leader>l", group = "[l]anguage/lsp" },
    { "<leader>la", vim.lsp.buf.code_action, desc = "code [a]ction" },
    { "<leader>ld", group = "[d]iagnostics" },
    { "<leader>ldd", function() vim.diagnostic.enable(false) end, desc = "[d]isable" },
    { "<leader>lde", vim.diagnostic.enable, desc = "[e]nable" },
    { "<leader>le", vim.diagnostic.open_float, desc = "diagnostics (show hover [e]rror)" },
    { "<leader>lg", ":Neogen<cr>", desc = "neo[g]en docstring" },
    { "<leader>o", group = "[o]tter & c[o]de" },
    { "<leader>oa", require'otter'.activate, desc = "otter [a]ctivate" },
    { "<leader>ob", insert_bash_chunk, desc = "[b]ash code chunk" },
    { "<leader>oc", "O# %%<cr>", desc = "magic [c]omment code chunk # %%" },
    { "<leader>od", require'otter'.activate, desc = "otter [d]eactivate" },
    { "<leader>oj", insert_julia_chunk, desc = "[j]ulia code chunk" },
    { "<leader>ol", insert_lua_chunk, desc = "[l]lua code chunk" },
    { "<leader>oo", insert_ojs_chunk, desc = "[o]bservable js code chunk" },
    { "<leader>op", insert_py_chunk, desc = "[p]ython code chunk" },
    { "<leader>or", insert_r_chunk, desc = "[r] code chunk" },
    { "<leader>q", group = "[q]uarto" },
    { "<leader>qE", function() require('otter').export(true) end, desc = "[E]xport with overwrite" },
    { "<leader>qa", ":QuartoActivate<cr>", desc = "[a]ctivate" },
    { "<leader>qe", require('otter').export, desc = "[e]xport" },
    { "<leader>qh", ":QuartoHelp ", desc = "[h]elp" },
    { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "[p]review" },
    { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "[q]uiet preview" },
    { "<leader>qr", group = "[r]un" },
    { "<leader>qra", ":QuartoSendAll<cr>", desc = "run [a]ll" },
    { "<leader>qrb", ":QuartoSendBelow<cr>", desc = "run [b]elow" },
    { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "to cu[r]sor" },
    { "<leader>r", group = "[r] R specific tools" },
    { "<leader>rt", show_r_table, desc = "show [t]able" },
    { "<leader>v", group = "[v]im" },
    { "<leader>vc", ":Telescope colorscheme<cr>", desc = "[c]olortheme" },
    { "<leader>vh", ':execute "h " . expand("<cword>")<cr>', desc = "vim [h]elp for current word" },
    { "<leader>vl", ":Lazy<cr>", desc = "[l]azy package manager" },
    { "<leader>vm", ":Mason<cr>", desc = "[m]ason software installer" },
    { "<leader>vs", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k<cr>", desc = "[s]ettings, edit vimrc" },
    { "<leader>vt", toggle_light_dark_theme, desc = "[t]oggle light/dark theme" },
    { "<leader>x", group = "e[x]ecute" },
    { "<leader>xx", ":w<cr>:source %<cr>", desc = "[x] source %" },
  }
}, { mode = 'n'})
