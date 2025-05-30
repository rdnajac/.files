-- Helper functions to install language servers and treesitter parsers
_G.mason_ensure_installed = function(tools)
    return {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = { ensure_installed = tools },
    }
  end

return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts_extend = { 'ensure_installed' },
    opts = { ensure_installed = {'stylua'} },
  },
  { import = 'nvim.lazy.spec.lang' },
}
