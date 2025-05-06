return {
  'folke/snacks.nvim',
  keys = function()
      -- stylua: ignore
    return {{',,', function() Snacks.terminal.toggle() end, mode = {'n','t'}}}
  end,

  ---@param opts snacks.Config
  opts = function(_, opts)
    opts.dashboard = require('util.munchies.dashboard')
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
        -- command_history = { layout = { preset = 'vscode' }, confirm = 'cmd' },
        autocmds      = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
        buffers       = { layout = { preset = 'vscode' } },
        commands      = { layout = { preset = 'ivy' } },
        files         = { layout = { preset = 'sidebar' } },
        grep          = { layout = { preset = 'ivy' }, follow = true, ignored = true },
        help          = { layout = { preset = 'vscode' } },
        keymaps       = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
        notifications = { layout = { preset = 'ivy_split' }, confirm = 'edit' },
        pickers       = { layout = { preset = 'vscode' } },
        zoxide        = { layout = { preset = 'vscode' }, confirm = 'edit' },

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

        -- https://learnvimscriptthehardway.stevelosh.com
        hardway = {
          finder = 'grep',
          hidden = true,
          ignored = true,
          follow = false,
          cwd = vim.fn.expand('$XDG_CONFIG_HOME/vim/docs/learnvimscriptthehardway'),
          confirm = function(picker, item) picker:close() vim.cmd('!open ' .. Snacks.picker.util.path(item)) end,
        },
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
