return {
  {
    'github/copilot.vim',
    enabled = false,
    -- init = function()
    --   vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    --     expr = true,
    --     replace_keycodes = false,
    --   })
    --   vim.g.copilot_no_tab_map = true
    -- end,
  },

  {
    'zbirenbaum/copilot.lua',
    enabled = true,
    opts = {
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
    },
  },
}
