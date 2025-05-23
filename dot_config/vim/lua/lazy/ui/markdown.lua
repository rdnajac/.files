require('render-markdown').setup({
  code = {
    sign = false,
    width = 'block',
    right_pad = 1,
  },
  heading = {
    sign = false,
    icons = {},
  },
  checkbox = {
    enabled = true,
  },
})

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

{
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = function()
    require('lazy').load({ plugins = { 'markdown-preview.nvim' } })
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    {
      '<leader>cp',
      ft = 'markdown',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = 'Markdown Preview',
    },
  },
  config = function()
    vim.cmd([[do FileType]])
  end,
},
