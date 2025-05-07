return {
  {
    'folke/lazy.nvim',
    version = false,
    keys = { { '<leader>l', '<Cmd>Lazy<CR>' } },
  },

  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    event = 'VeryLazy',
    cmd = 'Mason',
    keys = { { '<leader>m', '<Cmd>Mason<CR>', desc = 'Mason' } },
    opts = {
      ensure_installed = {
        'lua-language-server',
        'prettier',
        'ruff',
        'shellcheck',
        'shfmt',
        'stylua',
      },
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  {
    'stevearc/conform.nvim',
    event = 'InsertEnter',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  {
    'max397574/better-escape.nvim',
    event = 'VeryLazy',
    opts = {
      mappings = {
        i = {
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
          k = { j = '<Esc>' },
        },
        c = {
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
          k = { j = '<Esc>' },
        },
        t = {
          j = { k = '<C-\\><C-n>' },
          k = { j = '<C-\\><C-n>' },
        },
        v = {
          j = { k = '<Esc>' },
          k = { j = '<Esc>' },
        },
        s = {
          j = { k = '<Esc>' },
          k = { j = '<Esc>' },
        },
      },
    },
  },
}
