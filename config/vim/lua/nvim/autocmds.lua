local au = vim.api.nvim_create_autocmd
-- stylua: ignore start
local aug = function(name) return vim.api.nvim_create_augroup('user_' .. name, { clear = true }) end
local audebug = function(ev) print(string.format('event fired: %s', vim.inspect(ev))) end
-- stylua: ignore end

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
-- LazyVim autocmds
au({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = aug('checktime'),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
  desc = 'Reload file when changed',
})

au('TextYankPost', {
  group = aug('highlight_yank'),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
  desc = 'Highlight on yank',
})

au('VimResized', {
  group = aug('resize_splits'),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. current_tab)
  end,
  desc = 'Resize splits when window is resized',
})

au('BufReadPost', {
  group = aug('last_loc'),
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = 'Go to last location when opening a buffer',
})

au('FileType', {
  group = aug('close_with_q'),
  pattern = {
    'checkhealth',
    'help',
    'man',
    'qf',
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

au('BufWritePre', {
  group = aug('auto_create_dir'),
  callback = function(event)
    if event.match:match('^%w%w+:[\\/][\\/]') then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
  desc = 'Create directory if it does not exist',
})
