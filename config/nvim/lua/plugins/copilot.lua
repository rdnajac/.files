return {
  {
    'github/copilot.vim',
    enabled = false,
    init = function()
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    enabled = true,
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
}
