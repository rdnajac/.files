return {
  'folke/snacks.nvim',
  opts = function()
    ---@type snacks.Config
    return {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      -- toggle = { map = LazyVim.safe_keymap_set },
      image = { enabled = vim.env.TERM == 'xterm-kitty' },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        style = 'fancy',
        date_format = '%T',
        timeout = 1000,
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scratch = {
        ---@type table<string, snacks.win.Config>
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
      },
      scroll = { enabled = true },
      statuscolumn = {
        left = { 'sign' },
        right = { 'git' },
      },
      styles = {
        notification = { wo = { wrap = true } },
        scratch = { wo = { winhighlight = 'Normal:SpecialWindow' } },
        termial = { wo = { winhighlight = 'Normal:SpecialWindow' } },
      },

      ---@class snacks.terminal.Config
      terminal = {
        start_insert = false,
        auto_insert = true,
        auto_close = true,
        win = {
          wo = {
            winbar = '',
          },
        },
      },

      words = { enabled = true },

      ---@class snacks.dashboard.Config
      -- stylua: ignore
      dashboard = {
        preset = {
          keys = {
          { icon = ' ', title = 'Recent Files', key = 'f', action = function() Snacks.picker.recent() end,
            section = 'recent_files', indent = 2,
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = ' ', key = 'g', desc = 'Lazygit',  action = function() Snacks.lazygit() end },
          { icon = ' ', key = 'c', desc = 'Config',   action = function() Snacks.picker.nvimconfig() end },
          { icon = ' ', key = '.', desc = 'Dotfiles', action = function() Snacks.picker.dotfiles() end },
          { icon = '󰄻 ', key = 'z', desc = 'Zoxide',   action = function() Snacks.picker.zoxide() end  },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy',     action = ':Lazy' },
          { icon = ' ', key = 'x', desc = 'Extras',   action = ':LazyExtras' },
          { icon = ' ', key = 'q', desc = 'Quit',     action = ':qa' },
          }
        },
        formats = {
          key = function(item) return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } } end,
        },
        sections = {
          { section = 'terminal', cmd = require('util.dashboard').unown(), padding = 1, width = 69},
          { padding = 1 },
          { section = 'keys'},
          { section = 'terminal', cmd = require('util.dashboard').cowsay(), hl = 'header', padding = 1, indent = 9 },
          { padding = 1 },
          { section = 'startup',},
        },
      },

      ---@class snacks.picker.Config
      picker = {
        sources = {
          files = { follow = true },
          keymaps = { layout = { preset = 'vertical', fullscreen = true } },
          notifications = {
            win = { preview = { wo = { wrap = true } } },
            layout = { preset = 'vertical', fullscreen = true },
          },
          explorer = {
            win = {
              list = {
                keys = {
                  ['-'] = 'explorer_up',
                  ['l'] = 'confirm',
                  ['h'] = 'explorer_close',
                  ['<Right>'] = 'confirm',
                  ['<Left>'] = 'explorer_close',
                  ['r'] = 'explorer_rename',
                  ['c'] = 'explorer_copy',
                  ['m'] = 'explorer_move',
                  ['o'] = 'explorer_open',
                  ['P'] = 'toggle_preview',
                  ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
                  ['p'] = 'explorer_paste',
                  ['u'] = 'explorer_update',
                },
              },
            },
          },

          dotfiles = {
            finder = 'files',
            show_empty = true,
            hidden = true,
            follow = true,
            cwd = vim.fn.expand('$DOTDIR'),
          },

          nvimconfig = {
            finder = 'files',
            show_empty = true,
            hidden = true,
            follow = false,
            cwd = vim.fn.stdpath('config'),
          },

          -- FIXME:
          hardway = {
            finder = 'grep',
            hidden = true,
            ignored = true,
            follow = false,
            supports_live = true,

            cwd = vim.fn.expand('$XDG_CONFIG_HOME/vim/docs/learnvimscriptthehardway'),
            confirm = function(picker, item)
              picker:close()
              vim.cmd('!open ' .. Snacks.picker.util.path(item))
            end,
          },

          zoxide = {
            confirm = 'edit',
          },
        },
      },
    }
  end,
}
