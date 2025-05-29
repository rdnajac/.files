-- print('hi from lang/init.lua')
--
return {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig', { 'mason-org/mason.nvim', opts = {} } },
    opts_extend = { 'ensure_installed' },
    opts = {
      ensure_installed = { 'lua_ls' },
    },
  },
  { import = 'lazy.spec.lang' },
}
