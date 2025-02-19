---@module 'snacks'
---@class snacks.picker.Config
return {
  sources = {
    files = { follow = true },
    -- TODO: not like this...
    notifications = { win = { preview = { wo = { wrap = true } } } },
    keymaps = { layout = { preset = 'vertical' } },
  },
  win = {
    input = {
      -- stylua: ignore
      keys = {
        ['<a-c>'] = { 'toggle_cwd',   mode = { 'n', 'i' }, },
        ['<a-t>'] = { 'trouble_open', mode = { 'n', 'i' }, },
      } ,
    },
  },
  actions = {
    toggle_cwd = function(p)
      local root = LazyVim.root({ buf = p.input.filter.current_buf, normalize = true })
      local cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or '.')
      local current = p:cwd()
      p:set_cwd(current == root and cwd or root)
      p:find()
    end,
    require('trouble.sources.snacks').actions,
  },
}
