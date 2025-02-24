return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- and before all the other start plugins
    opts = {
      style = 'storm',
      dim_inactive = true,
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        sidebars = 'transparent',
        floats = 'transparent',
      },
      on_highlights = function(hl, c)
        hl['String'] = { fg = '#39ff14' }
      end,
    },
  },

  {
    'LazyVim/LazyVim',
    version = false,
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
      },
    },
    keys = {
      { '<leader>l', '<cmd>Lazy<CR>', desc = 'Lazy' },
      { '<leader>L', '<cmd>LazyExtras<CR>', desc = 'LazyExtras' },
    },
  },

  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'MunifTanjim/nui.nvim', lazy = true },
  { 'akinsho/bufferline.nvim', enabled = true, },
  { 'nvim-lualine/lualine.nvim', enabled = true, },
  { 'christoomey/vim-tmux-navigator' },
  { dir = '~/GitHub/src/vim-tbone/' },
  { 'max397574/better-escape.nvim', opts = {}, event = 'VeryLazy' },
}
