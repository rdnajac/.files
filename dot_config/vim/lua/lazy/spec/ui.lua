return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'rmd', 'quarto', 'codecompanion' },
      completions = { blink = { enabled = true } },
      bullet = {
        right_pad = 1,
      },
      -- checkbox = { enabled = false },
      code = {
	inline_pad = 1,
        border = 'thick',
        right_pad = 1,
        sign = true,
        width = 'block',
      },
      heading = {
        -- sign = false,
        icons = {},
        width = 'block',
        right_pad = 1,
        position = 'inline',
      },
      html = { comment = { conceal = false } },
    },
    ft = { 'markdown', 'rmd', 'quarto', 'codecompanion' },
    config = function(_, opts)
      require('render-markdown').setup(opts)
      Snacks.toggle({
        name = 'Render Markdown',
        get = function()
          return require('render-markdown.state').enabled
        end,
        set = function(enabled)
          local m = require('render-markdown')
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map('<leader>um')
    end,
  },
}
