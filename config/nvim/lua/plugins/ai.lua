return {
  {
    'github/copilot.vim',
    enabled = true,
    event = 'VeryLazy',
    init = function()
      vim.cmd([[
        imap <M-w> <Plug>(copilot-accept-word)
        imap <M-4> <Plug>(copilot-accept-line)
        imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
        let g:copilot_workspace_folders = ["~/GitHub"]
      ]])
    end,
  },

  -- https://codecompanion.olimorris.dev
  {
    'olimorris/codecompanion.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        -- Change copilot default chat adapter
        chat = {
          adapter = 'copilot',
        },
      },
      opts = {
        -- Set debug logging
        log_level = 'DEBUG',
      },
    },
  },
}
