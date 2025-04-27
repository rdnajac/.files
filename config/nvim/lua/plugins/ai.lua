return {
  {
    'github/copilot.vim',
    enabled = true,
    cmd = 'Copilot',
    event = 'VeryLazy',
    init = function()
      vim.g.copilot_no_maps = true
      vim.g.copilot_workspace_folders ={ "~/GitHub" } 
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

  -- TODO:
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
        chat = {
          adapter = 'copilot',
        },
      },
      opts = {
        log_level = 'DEBUG',
      },
    },
  },
}
