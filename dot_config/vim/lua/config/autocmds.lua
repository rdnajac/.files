local aug = function(aug)
  vim.api.nvim_create_augroup('nvim_' .. aug, { clear = true })
end

local audebug = function(ev)
  print(string.format('event fired: %s', vim.inspect(ev)))
end

vim.api.nvim_create_autocmd('TextYankPost', {
  group = aug('highlight_yank'),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
  desc = 'Highlight on yank',
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = aug('close_with_q'),
  pattern = {
    'checkhealth',
    'help',
    'man',
    'qf',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set('n', 'q', function()
        vim.cmd('close')
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = 'Quit buffer',
      })
    end)
  end,
})

vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = aug('cmdline'),
  callback = function()
    vim.cmd([[
        cnoreabbrev <expr> Snacks getcmdtype() == ':' && getcmdline() =~ '^Snacks' ? 'lua Snacks' : 'Snacks'
        cnoreabbrev <expr> snacks getcmdtype() == ':' && getcmdline() =~ '^snacks' ? 'lua Snacks' : 'snacks'
    ]])
  end,
  desc = 'Set up command line abbreviations when entering cmdline',
})

vim.api.nvim_create_autocmd('TermOpen', {
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

vim.api.nvim_create_autocmd('FileType', {
  group = aug('winhl'),
  pattern = { 'man', 'help' },
  callback = function()
    if Snacks.util.is_transparent() then
      vim.cmd([[setlocal winhighlight=Normal:SpecialWindow]])
    end
  end,
  desc = 'Set a bg color for certain filetypes',
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-path-prepend', { clear = true }),
  desc = 'Prepend LSP root and default path to &path on attach',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.config.root_dir then
      local root = vim.fn.escape(client.config.root_dir, ' \\')
      local default = vim.fn.escape(vim.o.path, ' \\')
      vim.cmd('set path-=' .. root)
      vim.cmd('set path-=' .. default)
      vim.cmd('set path^=' .. root)
      vim.cmd('set path^=' .. default)
    end
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.opt.laststatus = 0
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.opt.laststatus = 2
  end,
})
