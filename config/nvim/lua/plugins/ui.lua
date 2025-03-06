return {
  'folke/noice.nvim',
  enabled = true,

  opts = function()
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
    local config =  {
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
      presets = {
        lsp_doc_border = true,
      },

      cmdline = {
        format = {
          cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
          filter = { pattern = '^:%s*!', icon = '!', lang = 'bash' },
        },
      },

      routes = {
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
            },
          },
          opts = { skip = true },
        },
      },
    }
    return config
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
}
