return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  init = function()
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
  config = function()
    require('mini.align').setup()
    require('mini.icons').setup()
  end,
}
