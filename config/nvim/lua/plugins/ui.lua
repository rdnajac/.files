return {

  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      dashboard = require('config.snacks.dashboard'),
      notifier = {
        style = 'fancy',
        date_format = '%T',
      },
      styles = {
        notification = { wo = { wrap = true } },
        scratch = { wo = { winhighlight = 'Normal:SpecialWindow' } },
        termial = { wo = { winhighlight = 'Normal:SpecialWindow' } },
      },
      terminal = { win = { wo = { winbar = '' } } },
    },
  },
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
      config.lsp = { signature = { auto_open = { enabled = false } } }
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
              { find = 'There is no next R code chunk to go.' }
            },
          },
          opts = { skip = true },
        },
      }
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
    'folke/edgy.nvim',
    enabled = false,
    opts = {
      wo = {
        winbar = false,
      },
    },
  },
}
