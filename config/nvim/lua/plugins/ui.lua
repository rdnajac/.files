return {
  { 'akinsho/bufferline.nvim', enabled = true },
  { 'nvim-lualine/lualine.nvim', enabled = true },

  {
    'folke/edgy.nvim',
    enabled = false,
    cond = vim.g.snacks_animate,
    opts = { wo = { winbar = false } },
  },

  {
    'folke/noice.nvim',
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
        view = "cmdline",
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
  },
}
