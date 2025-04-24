return {
  {
    'folke/persistence.nvim',
    init = function()
      require('which-key').add({ { '<leader>p', group = 'Persistence', icon = ' ' } })
    end,
    keys = function()
    -- stylua: ignore
      return {
        { "<leader>ps", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>pS", function() require("persistence").select() end,desc = "Select Session" },
        { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>pd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
      }
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {
      menu = { width = vim.api.nvim_win_get_width(0) - 4 },
      settings = { save_on_toggle = true },
    },
    -- stylua: ignore
    keys = function()
      local harpoon = require("harpoon")
      local keys = {
        { '<leader>\\', function() harpoon:list():add() print('Oh! 🎣 A bite!') end, desc = 'Harpoon File', },
        { '<leader>|', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon Quick Menu', },
      }
      for i = 1, 5 do
        table.insert(keys, { '\\' .. i, function() harpoon:list():select(i) end, desc = 'Harpoon to File ' .. i, })
      end
      return keys
    end,
  },
}
