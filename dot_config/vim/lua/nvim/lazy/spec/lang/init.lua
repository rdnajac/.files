-- Helper functions to install language servers and treesitter parsers
_G.install = {
  language_servers = function(servers)
    return {
      'mason-org/mason.nvim',
      opts = { ensure_installed = servers },
    }
  end,

  treesitter_parsers = function(parsers)
    return {
      'nvim-treesitter/nvim-treesitter',
      opts = { ensure_installed = parsers },
    }
  end,
}

return {
  {
    'mason-org/mason.nvim',
    opts_extend = { 'ensure_installed' },
    opts = { ensure_installed = {} },
  },
  { import = 'nvim.lazy.spec.lang' },
}
