local au = vim.api.nvim_create_autocmd

local function aug(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

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
  -- command = 'setlocal formatoptions-=o',
  callback = function()
    if vim.bo.filetype ~= 'markdown' and vim.bo.filetype ~= 'python' then
      vim.opt_local.formatoptions:remove('o')
    end
  end,
  desc = 'Remove `o` from formatoptions',
})

--------------------------------------------------------------------------------
-- Quit immediately if we accidentally open a command window

au('CmdwinEnter', {
  group = aug('cmdwin'),
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
  group = aug('winhl'),
  pattern = { 'man', 'help' },
  callback = function()
    if Snacks.util.is_transparent() then
      vim.cmd([[setlocal winhighlight=Normal:SpecialWindow]])
    end
  end,
  desc = 'Set a bg color for certain filetypes',
})

--------------------------------------------------------------------------------

au('FileType', {
  group = aug('lua'),
  pattern = { 'lua' },
  callback = function()
    -- Do not highlight vimscript wrapped in `vim.cmd([[...]])`
    vim.api.nvim_set_hl(0, 'LspReferenceText', {})
  end,
  desc = 'lua filetype settings (in lua)',
})

--------------------------------------------------------------------------------
-- HACK: snacks dashboard weird interaction with lualine causes statusline
-- to be set set upon loading nvim with no args
-- see `global_statusline`
-- FIXME: This doesn't always work for some reason

au('User', {
  pattern = 'VeryLazy',
  group = aug('dashboard'),
  callback = function()
    if vim.bo.filetype == 'snacks_dashboard' then
      local original_laststatus = vim.o.laststatus

      vim.cmd('setlocal laststatus=0')
      vim.api.nvim_create_autocmd('BufLeave', {
        buffer = 0,
        once = true,
        callback = function()
          vim.o.laststatus = original_laststatus
        end,
      })
    end
  end,
})

--------------------------------------------------------------------------------
au('TermOpen', {
  group = aug('ooze'),
  callback = function(args)
    -- args.buf contains the buffer that triggered the autocmd
    if vim.bo[args.buf].filetype == 'snacks_terminal' then
      vim.g.ooze_channel = vim.bo[args.buf].channel
      vim.g.ooze_buffer = vim.api.nvim_get_current_buf()
      vim.g.ooze_send_on_enter = 1
    end
  end,
  desc = 'Capture the job ID (`channel`) of a newly opened terminal',
})

--------------------------------------------------------------------------------
-- Set up command line abbreviations only when entering cmdline mode
-- TODO: write a function to call the cmd with a formatted string

au('CmdlineEnter', {
  group = aug('cmdline'),
  callback = function()
    vim.cmd([[
        cnoreabbrev <expr> Snacks getcmdtype() == ':' && getcmdline() =~ '^Snacks' ? 'lua Snacks' : 'Snacks'
        cnoreabbrev <expr> snacks getcmdtype() == ':' && getcmdline() =~ '^snacks' ? 'lua Snacks' : 'snacks'
    ]])
  end,
})

--------------------------------------------------------------------------------
