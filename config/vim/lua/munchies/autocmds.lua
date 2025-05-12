local au = vim.api.nvim_create_autocmd
local aug = function(name)
  return vim.api.nvim_create_augroup('munchies_' .. name, { clear = true })
end
local audebug = function(ev)
  print(string.format('event fired: %s', vim.inspect(ev)))
end

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

au('CmdlineEnter', {
  group = aug('cmdline'),
  callback = function()
    vim.cmd([[
        cnoreabbrev <expr> Snacks getcmdtype() == ':' && getcmdline() =~ '^Snacks' ? 'lua Snacks' : 'Snacks'
        cnoreabbrev <expr> snacks getcmdtype() == ':' && getcmdline() =~ '^snacks' ? 'lua Snacks' : 'snacks'
    ]])
  end,
  desc = 'Set up command line abbreviations when entering cmdline',
})

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
  desc = 'Capture the job ID (`channel`) of a newly opened Snacks terminal',
})
