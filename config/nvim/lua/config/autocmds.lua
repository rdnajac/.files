-- autocmds.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/autocmds.lua
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
---@diagnostic disable-next-line
local audebug = function(ev)
  print(string.format('event fired: %s', vim.inspect(ev)))
end

--------------------------------------------------------------------------------

au('FileType', {
  group = aug('WORD'),
  pattern = { 'tmux', 'sshconfig' },
  callback = function()
    vim.cmd([[
    setlocal iskeyword+=-
    nmap <C-Space> viW
    ]])
  end,
})

--------------------------------------------------------------------------------
au('FileType', {
  group = aug('special_buffer_winhl'),
  pattern = { 'man', 'help' },
  callback = function()
    vim.cmd([[ setlocal winhighlight=Normal:NormalFloat ]])
  end,
})

--------------------------------------------------------------------------------

au('FileType', {
  group = aug('formatoptions'),
  pattern = '*',
  callback = function()
    vim.cmd([[set formatoptions-=o]])
  end,
})

--------------------------------------------------------------------------------

au('FileType', {
  group = aug('lua'),
  pattern = { 'lua' },
  callback = function()
    -- don't highlight vim code wrapped in vim.cmd([[ ]])
    vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = 'NONE' })
  end,
})

--------------------------------------------------------------------------------

au('FileType', {
  group = aug('r'),
  pattern = { 'r' },
  callback = function()
    if vim.fn.exists(':RDebugInfo') then
      vim.cmd([[
        autocmd TermOpen * exe 'hi MyWin guibg=#1f2335' | setlocal nonu nornu winhighlight=Normal:MyWin
        " open R.nvim terminal
        nmap <buffer> ,, <nop>
        nmap <buffer> ,, <localleader>rf
        " send line to R.nvim terminal
        nmap <bufer> <CR> <nop>
        nmap <bufer> <CR> <localleader>l
    ]])

      -- set up keymaps
      -- <leader>R to send 'source(".Rprofile")' to the running R terminal
      vim.cmd([[
    nmap <buffer> <leader>R <Cmd>RSend(source(".Rprofile"))<CR>
    ]])
    end
  end,
})

--------------------------------------------------------------------------------

au('User', {
  group = aug('lol'),
  pattern = { 'lol' },
  callback = function(ev)
    audebug(ev)
    vim.cmd([[echom '>^.^<']])
  end,
})
