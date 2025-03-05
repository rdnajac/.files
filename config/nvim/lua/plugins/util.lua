return {

  ---@module 'snacks'
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    version = false,
    keys = require('plugins.snacks.keys'),
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
      -- stylua: ignore
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function()    Snacks.debug.backtrace()  end
        -- Override print to use snacks for `:=` command
        vim.print = _G.dd
        -- Prepend any cmd with `Snacks` with lua to run it correctly
        vim.cmd([[
        cnoreabbrev <expr> Snacks getcmdtype() == ':' && getcmdline() =~ '^Snacks' ? 'lua Snacks' : 'Snacks'
        ]])
        -- Set up toggles
        require('plugins.snacks.toggle')
      end,
      })
    end,

    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        style = 'fancy',
        date_format = '%T',
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      toggle = { enabled = true },
      words = { enabled = true },

      dashboard = require('plugins.snacks.dashboard'),
      picker = require('plugins.snacks.picker'),
      -- terminal = require('plugins.snacks.terminal'),

      styles = {
        notification = { wo = { wrap = true } },
        scratch = { wo = { winhighlight = 'Normal:NormalFloat' } },
        termial = { wo = { winhighlight = 'Normal:NormalFloat' } },
      },
    },
  },

  -- session management
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    init = function()
      require('which-key').add({ { '<leader>p', group = 'Persistence', icon = ' ' } })
    end,
    -- stylua: ignore
    keys = {
      { "<leader>qs", false },
      { "<leader>qS", false },
      { "<leader>ql", false },
      { "<leader>qd", false },
      { "<leader>ps", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>pS", function() require("persistence").select() end,desc = "Select Session" },
      { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>pd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    enabled = false,
    opts = {
      menu = { width = vim.api.nvim_win_get_width(0) - 4 },
      settings = { save_on_toggle = true },
    },
    keys = function()
    -- stylua: ignore
    local keys = {
      { "<leader>H", function() require("harpoon"):list():add() end, desc = "Harpoon File", },
      { '<leader>\\', function() require('harpoon'):list():add() end, desc = 'Harpoon File', },
      { "<leader>h", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Quick Menu",},
      { '<localleader>\\', function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon Quick Menu',},
    }
      for i = 1, 5 do
        table.insert(keys, {
          '\\' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end
      return keys
    end,
  },
}
