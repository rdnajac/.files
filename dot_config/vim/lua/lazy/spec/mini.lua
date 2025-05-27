return {
  'echasnovski/mini.nvim',
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
  init = function()
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
  config = function()
    require('mini.align').setup()
    require('mini.icons').setup()
    require('mini.diff').setup({
      mappings = {
        apply = '',
        reset = '',
        textobject = '',
      },
      view = {
        style = 'sign',
        signs = {
          add = '▎',
          change = '▎',
          delete = '',
        },
      },
    })

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
}
