return {
  { 'akinsho/bufferline.nvim', enabled = true },
  { 'nvim-lualine/lualine.nvim', enabled = true },
  {
    'folke/noice.nvim',
    opts = function(_, opts)
      Snacks.toggle({
        name = 'Noice',
        get = function()
          return require('noice.config').is_running()
        end,
        set = function(state)
          if state then
            require('noice').enable()
          else
            require('noice').disable()
          end
        end,
      }):map('<leader>uN', { desc = 'Toggle Noice' })

      ---@class NoiceConfig
      local config = opts

      config.cmdline = {
        format = {
          cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
          filter = { pattern = '^:%s*!', icon = '!', lang = 'bash' },
        },
      }
      config.lsp = {
        signature = { auto_open = { enabled = false } },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      }
      config.presets = { lsp_doc_border = true }
      config.routes = {
        {
          filter = {
            cmdline = '^:%s*!',
            kind = 'shell_out',
          },
          view = 'split',
        },
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '^E486: Pattern not found' },
              { find = 'E85: There is no listed buffer' },
              { find = 'E490: No fold found' },
              { find = 'Already at oldest change' },
              { find = 'There is no next R code chunk to go.' },
            },
          },
          opts = { skip = true },
        },
      }
      return opts
    end,

    keys = {
      {
        '<M-Enter>',
        function()
          require('noice').redirect(vim.fn.getcmdline())
        end,
        mode = 'c',
        desc = 'Redirect Cmdline',
      },
    },
  },

  {
    'folke/snacks.nvim',
    opts = function()
      ---@type snacks.Config
      return {
        indent = { enabled = true },
        input = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = {
          left = { 'sign' },
          right = { 'git' },
        },
        words = { enabled = true },
        notifier = {
          style = 'fancy',
          date_format = '%T',
        },
        styles = {
          notification = { wo = { wrap = true } },
          scratch = { wo = { winhighlight = 'Normal:SpecialWindow' } },
          termial = { wo = { winhighlight = 'Normal:SpecialWindow' } },
        },
          ---@class snacks.dashboard.Config
          -- stylua: ignore
        dashboard = {
          formats = {
            key = function(item) return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } } end,
          },
        -- TODO: override keys section
          sections = {
            { section = 'terminal', cmd = require('util.munchies.terminal').unown(), padding = 1, width = 69},
            { padding = 1 },
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
            { section = 'terminal', cmd = require('util.munchies.terminal').cowsay(), hl = 'header', padding = 1, indent = 8 },
            { section = 'startup', padding = 1, },
          },
        },
      }
    end,
  },

  {
    'folke/edgy.nvim',
    enabled = false,
    opts = {
      wo = {
        winbar = false,
      },
    },
  },
}
