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
      win = { preview = { wo = { number = false, statuscolumn = '' } } },
      sources = {
        autocmds = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
        buffers = { layout = { preset = 'vscode' } },
        command_history = { layout = { win = 'list', border = 'single' } },
        zoxide = { confirm = 'edit' },
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
      -- wo = { winhighlight = 'Normal:SpecialWindow' },
    }
    opts.statuscolumn = { left = { 'sign' }, right = { 'git' } }
    opts.styles = {
      scratch = { wo = { winhighlight = 'Normal:SpecialWindow' } },
      --   -- notification = { wo = { wrap = true } },
    }
    opts.terminal = {
      start_insert = true,
      auto_insert = false,
      auto_close = true,
      win = { wo = { winbar = '', winhighlight = 'Normal:SpecialWindow' } },
    }
  end,
}
