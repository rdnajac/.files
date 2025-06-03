
return {
  mason_ensure_installed({ 'lua-language-server', 'stylua' }),
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = 'LazyVim', words = { 'LazyVim' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
        { path = 'lazy.nvim', words = { 'LazyVim' } },
      },
    },
    init = function()
      -- Patch before plugin loads
      local lazydev_path = require('lazy.core.config').spec.plugins['lazydev.nvim'].dir
      package.preload['lazydev.lsp'] = function()
        local mod = dofile(lazydev_path .. '/lua/lazydev/lsp.lua')
        local orig_supports = mod.supports
        mod.supports = function(client)
          -- correcrly identify the name of the lsp client
          if client and vim.tbl_contains({ 'luals' }, client.name) then
            return true
          end
          dd('in supports')
          return orig_supports(client)
        end
        return mod
      end
    end,
  },
}
