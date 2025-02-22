-- snacks config: read the docs!
---@module 'snacks'
return {
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
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    toggle = { enabled = true },
    words = { enabled = true },

    dashboard = require('plugins.snacks.dashboard'),
    picker = require('plugins.snacks.picker'),
    terminal = require('plugins.snacks.terminal'),

    styles = {
      notification = { wo = { wrap = true } },
      scratch = { wo = { winhighlight = 'Normal:NormalFloat' } },
      termial = { wo = { winhighlight = 'Normal:NormalFloat' } },
    },
  },
}
