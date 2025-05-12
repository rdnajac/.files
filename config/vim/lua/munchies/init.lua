local M = {}

---@type snacks.Config
M.opts = {
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  -- dashboard = require('munchies.dashboard'),
  explorer = { enabled = true },
  image = { enabled = true },
  -- image = { enabled = vim.env.TERM == 'xterm-kitty' },
  indent = { indent = { only_current = true, only_scope = true } },
  input = { enabled = true },
  notifier = { style = 'fancy', date_format = '%T', timeout = 2000 },
  picker = {
    layouts = {
      vscode = {
        layout = {
          backdrop = false,
          row = 1,
          width = 0.4,
          min_width = 80,
          height = 0.4,
          -- border = 'rounded',
          box = 'vertical',
          {
            win = 'input',
            height = 1,
            -- border = 'rounded',
            title = '{title} {live} {flags}',
            title_pos = 'center',
          },
          { win = 'list', border = 'none' },
        },
      },
    },
    win = { preview = { minimal = true } },
    sources = {
      -- command_history = { layout = { preset = 'vscode' }, confirm = 'cmd' },
      autocmds = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
      buffers = { layout = { preset = 'vscode' } },
      commands = { layout = { preset = 'ivy' } },
      explorer = {
        git_untracked = false,
        win = {
          list = {
            keys = {
              ['-'] = 'explorer_up',
              -- ['l'] = 'confirm',
              -- ['h'] = 'explorer_close',
              ['<Right>'] = 'confirm',
              ['<Left>'] = 'explorer_close',
              ['c'] = 'explorer_copy',
              ['m'] = 'explorer_move',
              ['r'] = 'explorer_rename',
              -- ['o'] = 'explorer_open',
              ['P'] = 'toggle_preview',
              ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
              ['p'] = 'explorer_paste',
              ['u'] = 'explorer_update',
            },
          },
        },
      },
      files = { layout = { preset = 'sidebar' } },
      grep = { layout = { preset = 'ivy' }, follow = true, ignored = true },
      help = { layout = { preset = 'vscode' } },
      keymaps = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
      notifications = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
      pickers = { layout = { preset = 'vscode' } },
      zoxide = { layout = { preset = 'vscode' }, confirm = 'edit' },
    },
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scratch = {
    win_by_ft = {
      vim = {
        keys = {
          ['source'] = {
            '<CR>',
            function(self)
              vim.cmd('source ' .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(self.buf)))
            end,
            desc = 'Source buffer',
            mode = { 'n', 'x' },
          },
        },
      },
    },
  },
  scroll = { enabled = true },
  statuscolumn = { left = { 'sign' }, right = { 'git' } },
  styles = {
    scratch = { wo = { winhighlight = 'Normal:SpecialWindow' } },
    -- notification = { wo = { wrap = true } },
  },
  terminal = {
    start_insert = true,
    auto_insert = false,
    auto_close = true,
    win = { wo = { winbar = '', winhighlight = 'Normal:SpecialWindow' } },
  },
  words = { enabled = true },
}

require('snacks').setup(M.opts)

_G.dd = function(...)
  Snacks.debug.inspect(...)
end

_G.bt = function()
  Snacks.debug.backtrace()
end

-- Override print to use snacks for `:=` command
vim.print = _G.dd

require('munchies.autocmds')
require('munchies.keymaps')

vim.api.nvim_create_user_command('Scriptnames', function()
  require('util.munchies.picker').scriptnames()
end, { desc = 'Scriptnames' })
