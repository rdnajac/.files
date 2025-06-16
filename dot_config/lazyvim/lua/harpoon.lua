return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    menu = { width = vim.api.nvim_win_get_width(0) - 4 },
    settings = { save_on_toggle = true },
  },
  -- stylua: ignore
  keys = function()
    local harpoon = require('harpoon')
    local keys = {
      { '<leader>\\', function() harpoon:list():add() print('Oh! 🎣 A bite!') end, desc = 'Harpoon File' },
      { '<leader>|', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon Quick Menu' },
    }
    for i = 1, 5 do
      table.insert(keys, { '\\' .. i, function() harpoon:list():select(i) end, desc = 'Harpoon to File ' .. i })
    end
    return keys
  end,
}
