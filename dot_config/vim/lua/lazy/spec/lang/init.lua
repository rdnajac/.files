-- Helper functions to install language servers and treesitter parsers
_G.install = {
  language_servers = function(servers)
    return {
      "mason-org/mason-lspconfig.nvim",
      opts = { ensure_installed = servers },
    }
  end,

  treesitter_parsers = function(parsers)
    return {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = parsers },
    }
  end,
}

return {
  {
    'mason-org/mason-lspconfig.nvim',
    event = 'VeryLazy',
    dependencies = { 'neovim/nvim-lspconfig', { 'mason-org/mason.nvim', opts = {} } },
    opts_extend = { 'ensure_installed' },
    opts = {
      ensure_installed = { 'lua_ls' },
    },
  },
  { import = 'lazy.spec.lang' },
}
