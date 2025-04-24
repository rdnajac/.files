return {
  {
    'github/copilot.vim',
    enabled = true,
    cmd = 'Copilot',
    event = 'BufWinEnter',
    -- event = 'VeryLazy',
    init = function()
      vim.g.copilot_no_maps = true
      -- vim.cmd([[
      --   imap <M-w> <Plug>(copilot-accept-word)
      --   imap <M-L> <Plug>(copilot-accept-line)
      --   imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
      --   let g:copilot_no_tab_map = v:true
      --   let g:copilot_workspace_folders = ["~/GitHub"]
      -- ]])
    end,
    config = function()
      -- Block the normal Copilot suggestions
      vim.api.nvim_create_augroup('github_copilot', { clear = true })
      vim.api.nvim_create_autocmd({ 'FileType', 'BufUnload' }, {
        group = 'github_copilot',
        callback = function(args)
          vim.fn['copilot#On' .. args.event]()
        end,
      })
      vim.fn['copilot#OnFileType']()
    end,
  },

  {
    'saghen/blink.cmp',
    dependencies = { 'fang2hou/blink-copilot' },
    opts = {
      sources = {
        default = { 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
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
