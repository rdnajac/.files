return {
  'folke/snacks.nvim',
  keys = function()
      -- stylua: ignore
    return {{',,', function() Snacks.terminal.toggle() end, mode = {'n','t'}}}
  end,

  ---@param opts snacks.Config
  opts = function(_, opts)
    opts.dashboard = require('config.snacks.dashboard')
    opts.image = { enabled = vim.env.TERM == 'xterm-kitty' }
    opts.indent = { indent = { only_current = true, only_scope = true } }
    opts.notifier = { style = 'fancy', date_format = '%T', timeout = 2000 }
    opts.picker = {
      layouts = {
        vscode = {
          layout = {
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.4,
            border = 'rounded',
            box = 'vertical',
            {
              win = 'input',
              height = 1,
              border = 'rounded',
              title = '{title} {live} {flags}',
              title_pos = 'center',
            },
            { win = 'list', border = 'none' },
          },
        },
      },
      win = { preview = { minimal = true } },
      -- stylua: ignore
      sources = {
        autocmds = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
        buffers  = { layout = { preset = 'vscode' } },
        commands = { layout = { preset = 'ivy' } },
        -- command_history = { layout = { preset = 'vscode' }, confirm = 'cmd' },
        explorer = require('config.snacks.explorer'),
        files    = { layout = { preset = 'sidebar' } },
        grep     = { layout = { preset = 'dropdown' } },
        help     = { layout = { preset = 'vscode' } },
        keymaps  = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
        pickers  = { layout = { preset = 'vscode' } },
        zoxide   = { layout = { preset = 'vscode' }, confirm = 'edit' },
      },
    }
    opts.scratch = {
      win_by_ft = {
        vim = {
          keys = {
            ['source'] = {
              '<cr>',
              function(self)
                vim.cmd('source ' .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(self.buf)))
              end,
              desc = 'Source buffer',
              mode = { 'n', 'x' },
            },
          },
        },
      },
    }
    opts.statuscolumn = { left = { 'sign' }, right = { 'git' } }
    opts.styles = {
      scratch = { wo = { winhighlight = 'Normal:SpecialWindow' } },
      -- notification = { wo = { wrap = true } },
    }
    opts.terminal = {
      start_insert = true,
      auto_insert = false,
      auto_close = true,
      win = { wo = { winbar = '', winhighlight = 'Normal:SpecialWindow' } },
    }
  end,
}
