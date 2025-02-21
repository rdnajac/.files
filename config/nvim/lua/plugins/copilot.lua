return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'BufReadPost',
    opts = function()
      LazyVim.cmp.actions.ai_accept = function()
        if require('copilot.suggestion').is_visible() then
          LazyVim.create_undo()
          require('copilot.suggestion').accept()
          return true
        end
      end
      return {
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
          keymap = {
            -- accept = '<M-j>',
            accept = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<M-\\>',
          },
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
      }
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    event = 'VeryLazy',
    opts = function(_, opts)
      table.insert(
        opts.sections.lualine_x,
        2,
        LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
          local clients = package.loaded['copilot'] and LazyVim.lsp.get_clients({ name = 'copilot', bufnr = 0 }) or {}
          if #clients > 0 then
            local status = require('copilot.api').status.data.status
            return (status == 'InProgress' and 'pending') or (status == 'Warning' and 'error') or 'ok'
          end
        end)
      )
    end,
  },
}
