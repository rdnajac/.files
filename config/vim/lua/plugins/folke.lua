return {
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- Section: todo-comments
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    opts = {
      keywords = { Section = { icon = '󰚟', color = 'title' } },
      -- highlight = { keyword = 'bg', },
      colors = { title = { '#7DCFFF' } },
    },
    -- stylua: ignore
    keys = {
      { ']t', function() require('todo-comments').jump_next() end, desc = 'Next Todo Comment', },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous Todo Comment', },
    },
  },
}
