-- lua/config/autocmds.lua
vim.api.nvim_del_augroup_by_name('lazyvim_wrap_spell')

-- Create shorthand for nvim_create_autocmd API
local au = vim.api.nvim_create_autocmd

-- Function declaration using 'local function' syntax
-- This is hoisted, meaning it can be called before its declaration in the code
-- Useful for functions that need to reference themselves (recursion)
local function aug(name)
  return vim.api.nvim_create_augroup('config_' .. name, { clear = true })
end

-- Function expression assigned to a variable
-- Cannot be called before this line (no hoisting)
-- More flexible for anonymous functions and closures
local audebug = function(ev)
  print(string.format('event fired: %s', vim.inspect(ev)))
end


--------------------------------------------------------------------------------
-- `User` autocmds are not executed automatically. Use `:doautocmd` to trigger

au('User', {
  group = aug('lol'),
  pattern = { 'lol' },
  callback = function(ev)
    audebug(ev)
    vim.cmd([[echom '>^.^<']])
  end,
  desc = 'Trigger this autocmd with `:doautocmd User lol`',
})

--------------------------------------------------------------------------------
-- Some ft plugins set formatoptions, so we have to run this after they load

au('FileType', {
  group = aug('formatoptions'),
  pattern = '*',
  command = 'set formatoptions-=o',
  desc = 'Remove `o` from formatoptions',
})

--------------------------------------------------------------------------------
-- Quit immediately if we accidentally open a command window

au('CmdwinEnter', {
  group = aug('no_cmdwin'),
  pattern = '*',
  command = 'quit',
  desc = 'Quit command window immediately',
})

--------------------------------------------------------------------------------
-- Treesitter's node selection (`<C-Space>`) doesn't work well in some filetypes

au('FileType', {
  group = aug('WORD'),
  pattern = { 'tmux', 'sshconfig' },
  callback = function()
    vim.cmd([[
    setlocal iskeyword+=-
    nmap <C-Space> viW
    ]])
  end,
  desc = 'Add `-` to iskeyword and map <C-Space> to select WORD',
})

--------------------------------------------------------------------------------
-- Even with a transparent background, some buffers are more readable with a bg

au('FileType', {
  group = aug('special_buffer_winhl'),
  pattern = { 'man', 'help' },
  command = 'setlocal winhighlight=Normal:SpecialWindow',
  desc = 'Set a bg color for certain filetypes',
})

--------------------------------------------------------------------------------

au('FileType', {
  group = aug('lua'),
  pattern = { 'lua' },
  callback = function()
    vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = 'NONE' })
  end,
  desc = 'Do not highlight vimscript wrapped in `vim.cmd([[...]])`',
})

