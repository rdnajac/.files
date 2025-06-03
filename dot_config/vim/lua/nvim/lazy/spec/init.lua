local Event = require('lazy.core.handler.event')
Event.mappings.LazyFile = {
  id = 'LazyFile',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
Event.mappings['User LazyFile'] = Event.mappings.LazyFile

return {
  { -- https://www.lazyvim.org/news
    'LazyVim/LazyVim',
    priority = 9999,
    dev = true,
    init = function()
      vim.g.lazyvim_check_order = false
      -- noop if we skip importing plugins
      -- package.loaded['lazyvim.config.options'] = true
    end,
    -- stylua: ignore
    keys = {
      { 'gL', function() require('nvim.lazy.goto') end, { desc = 'Goto LazyVim module' }, },
      { '<leader>l', '<Cmd>Lazy<CR>', desc = 'Lazy' },
      { '<leader>L', '<Cmd>LazyExtras<CR>', desc = 'LazyExtras' },
    },
    { import = 'lazyvim.plugins.extras.util.mini-hipatterns' },
  },
  { 'nvim-lua/plenary.nvim', lazy = true },
}
