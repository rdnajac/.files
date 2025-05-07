return {
  {
    'echasnovski/mini.align',
    opts = {},
    keys = {
      { 'ga', mode = 'x', desc = 'Align' },
      { 'gA', mode = 'x', desc = 'Align Visual' },
    },
  },
  {
    'echasnovski/mini.surround',
    event = 'InsertEnter',
    opts = {
      mappings = {
        add = 'ys',
        delete = 'ds',
        replace = 'cs',
      },
      search_method = 'cover_or_next',
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          local map = vim.keymap.set
          map('v', '`', 'ys`', { remap = true, desc = 'Surround selection with backticks' })
          map('v', 'b', 'ys`', { remap = true, desc = 'Surround selection (bold)' })
          map('v', 'S', 'ys', { remap = true, desc = 'Surround selection' })
          map('n', 'S', 'viWys', { remap = true, desc = 'Surround WORD' })
          map('n', 'yss', 'ys_', { remap = true, desc = 'Surround line' })
        end,
      })
    end,
  },
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },

  {
    'echasnovski/mini.diff',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>go',
        function()
          require('mini.diff').toggle_overlay(0)
        end,
        desc = 'Toggle mini.diff overlay',
      },
    },
    opts = {
      view = {
        style = 'sign',
        signs = {
          add = '▎',
          change = '▎',
          delete = '',
        },
      },
    },
  },
  {
    'mini.diff',
    opts = function()
      Snacks.toggle({
        name = 'Mini Diff Signs',
        get = function()
          return vim.g.minidiff_disable ~= true
        end,
        set = function(state)
          vim.g.minidiff_disable = not state
          if state then
            require('mini.diff').enable(0)
          else
            require('mini.diff').disable(0)
          end
          -- HACK: redraw to update the signs
          vim.defer_fn(function()
            vim.cmd([[redraw!]])
          end, 200)
        end,
      }):map('<leader>uG')
    end,
  },
}
